import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/data/models/cashpool_settlement/cashpool_suggested_settlement.dart";
import "package:diehugosapp/data/models/cashpool_settlement/cmds/cashpool_settlement_create_cmd.dart";
import "package:diehugosapp/presentation/screens/cashpool/detail/settle/settlement_details_sheet/cashpool_settlement_transaction_details_controller.dart";
import "package:diehugosapp/presentation/screens/cashpool/detail/settle/settlement_details_sheet/cashpool_settlement_transaction_details_sheet.dart";
import "package:diehugosapp/services/auth_service.dart";
import "package:diehugosapp/services/cashpool_settlement_service.dart";
import "package:diehugosapp/services/epc_qr_service.dart";
import "package:diehugosapp/services/toaster_service.dart";
import "package:flutter/widgets.dart";
import "package:forui/assets.dart";
import "package:get/get.dart";

class CashpoolDetailSettleController extends GetxController {
  CashpoolDetailSettleController({
    required this.toastService,
    required this.authService,
    required this.cashpoolSettlementService,
  });

  late final ToastService toastService;
  late final AuthService authService;
  late final CashpoolSettlementService cashpoolSettlementService;

  late final int cashpoolId;
  final Rx<UiState> state = UiState.loading().obs;
  final RxList<CashpoolSuggestedSettlement> settlements = RxList.empty();

  @override
  Future<void> onInit() async {
    super.onInit();
    cashpoolId = (Get.arguments as Map<String, int>)["id"]!;
    await fetch();
  }

  Future<void> fetch() async {
    state.value = UiState.loading();
    try {
      settlements.value =
          (await cashpoolSettlementService.getSuggestedSettlementsByCashpoolId(
            cashpoolId,
          )).toList();
      state.value = UiState.success();
    } on Exception catch (e) {
      debugPrint(e.toString());
      state.value = UiState.error();
    }
  }

  bool isSettlementSettleableForMe(CashpoolSuggestedSettlement settlement) =>
      settlement.from.id == authService.user?.id &&
      settlement.to.id != authService.user?.id;

  bool handleDismissSettlementAttempt(CashpoolSuggestedSettlement settlement) {
    if (!isSettlementSettleableForMe(settlement)) {
      toastService.show(
        title: "Du darfst das nicht!",
        description: "Nur der zu Überweisende darf als überwiesen markieren.",
        icon: const Icon(FIcons.ban),
      );
      return false;
    }
    return true;
  }

  Future<void> handleSettleSettlementAction(
    CashpoolSuggestedSettlement settlement,
  ) async {
    if (!handleDismissSettlementAttempt(settlement)) return;

    try {
      final cmd = CashpoolSettlementCreateCmd(
        cashpoolId: cashpoolId,
        fromUserId: settlement.from.id,
        toUserId: settlement.to.id,
        purpose: "Abrechnung",
        amountCents: settlement.amountCents,
      );
      await cashpoolSettlementService.create(cmd);

      await fetch();

      toastService.show(
        title: "Überweisung eingetragen",
        description: "Die Überweisung wurde erfolgreich eingetragen.",
        icon: const Icon(FIcons.check),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
      toastService.show(
        title: "Fehler",
        description: "Die Überweisung konnte nicht eingetragen werden: $e",
        icon: const Icon(FIcons.ban),
      );
    }
  }

  Future<void> handleSettlementPress(int i) async {
    Get.lazyPut(
      () => CashpoolSettlementTransactionDetailsController(
        cashpoolSettlementService: cashpoolSettlementService,
        epcQrService: Get.find<EpcQrService>(),
        toastService: toastService,
        authService: authService,
      ),
    );

    final result = await Get.bottomSheet<dynamic>(
      const CashpoolSettlementTransactionDetailsSheet(),
      settings: RouteSettings(
        arguments: {
          "settlement": settlements[i],
          "cashpoolId": cashpoolId,
        },
      ),
      backgroundColor: Get.theme.colorScheme.surface,
      isScrollControlled: true,
    );

    if (result == true) {
      await fetch();
    }
  }
}
