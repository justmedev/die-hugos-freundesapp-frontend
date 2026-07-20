import "dart:async";

import "package:diehugosapp/core/errors/not_a_cashpool_member.dart";
import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/data/models/cashpool/cashpool_detailed.dart";
import "package:diehugosapp/data/models/cashpool_settlement/cashpool_user_settlement_summary.dart";
import "package:diehugosapp/data/models/cashpool_transactions/cashpool_transaction.dart";
import "package:diehugosapp/data/models/cashpool_transactions/cashpool_transaction_event.dart";
import "package:diehugosapp/presentation/screens/cashpool/detail/create_transaction_sheet/cashpool_create_transaction_controller.dart";
import "package:diehugosapp/presentation/screens/cashpool/detail/create_transaction_sheet/cashpool_create_transaction_sheet.dart";
import "package:diehugosapp/presentation/screens/cashpool/detail/join_dialog/cashpool_detail_join_controller.dart";
import "package:diehugosapp/presentation/screens/cashpool/detail/join_dialog/cashpool_detail_join_dialog.dart";
import "package:diehugosapp/services/auth_service.dart";
import "package:diehugosapp/services/cashpool_member_service.dart";
import "package:diehugosapp/services/cashpool_service.dart";
import "package:diehugosapp/services/cashpool_settlement_service.dart";
import "package:diehugosapp/services/cashpool_transaction_service.dart";
import "package:diehugosapp/services/dialog_service.dart";
import "package:diehugosapp/services/toaster_service.dart";
import "package:flutter/cupertino.dart";
import "package:get/get.dart";

class CashpoolDetailController extends GetxController {
  CashpoolDetailController({
    required this.toastService,
    required this.authService,
    required this.cashpoolService,
    required this.cashpoolTransactionService,
    required this.cashpoolSettlementService,
    required this.dialogService,
  });

  late final ToastService toastService;
  late final AuthService authService;
  late final CashpoolService cashpoolService;
  late final CashpoolTransactionService cashpoolTransactionService;
  late final CashpoolSettlementService cashpoolSettlementService;
  late final DialogService dialogService;

  final RxBool isHeaderShowingTotal = true.obs;
  final Rx<UiState> state = UiState.loading().obs;
  final Rxn<CashpoolDetailed> cashpool = Rxn();
  final Rxn<CashpoolUserSettlementSummary> cashpoolUserSettlementSummary =
      Rxn();
  final RxList<CashpoolTransaction> transactions = RxList.empty();
  StreamSubscription<CashpoolTransactionEvent>? _transactionSubscription;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchCashpoolDetails();
    await fetchCashpoolUserSettlementSummary();
    await _startListeningToSSETransactions();
  }

  Future<void> _startListeningToSSETransactions() async {
    final id = cashpool.value?.id;
    if (id == null) return;

    _transactionSubscription =
        (await cashpoolTransactionService.listenToCashpoolTransactions(
          id,
        )).listen(_handleSseEvent);
  }

  Future<void> _handleSseEvent(CashpoolTransactionEvent event) async {
    if (event is Created) {
      if (event.transaction.owner.id == authService.user?.id) return;
      transactions.insert(0, event.transaction);
    } else if (event is Updated) {
      if (event.transaction.owner.id == authService.user?.id) return;
      final index = transactions.indexWhere(
        (t) => t.id == event.transaction.id,
      );
      if (index != -1) transactions[index] = event.transaction;
    } else if (event is Deleted) {
      if (event.emittingUserId == authService.user?.id) return;
      transactions.removeWhere((t) => t.id == event.transactionId);
    }

    await fetchCashpoolUserSettlementSummary();
  }

  Future<void> fetchCashpoolDetails() async {
    state.value = UiState.loading();
    final id = (Get.arguments as Map<String, int>)["id"];
    if (id == null) {
      state.value = UiState.error("No id found!");
      return;
    }
    try {
      cashpool.value = await cashpoolService.getDetailed(id!);
      state.value = UiState.success();

      await fetchCashpoolTransactions();
    } on NotACashpoolMember {
      Get.put(
        CashpoolDetailJoinController(
          cashpoolMemberService: Get.find<CashpoolMemberService>(),
        ),
      );
      final hasJoined = await dialogService.show<bool>(
        dismissable: false,
        routeSettings: RouteSettings(arguments: {"id": id}),
        builder: (context, style, animation) {
          return const CashpoolDetailJoinDialog();
        },
      );
      if (hasJoined == true) await fetchCashpoolDetails();
    } catch (e) {
      cashpool.value = null;
      state.value = UiState.error();
      rethrow;
    }
  }

  Future<void> fetchCashpoolTransactions() async {
    if (cashpool.value == null) {
      debugPrint("A cashpool has to be loaded first!");
      state.value = UiState.error(
        "A cashpool has to be loaded before loading transactions",
      );
      return;
    }
    state.value = UiState.loading();

    try {
      transactions
        ..clear()
        ..addAll(
          await cashpoolTransactionService.getByCashpool(cashpool.value!.id),
        );
    } on Exception catch (e) {
      print(e);
      state.value = UiState.error("Unable to fetch transactions");
    }
    state.value = UiState.success();
  }

  Future<void> fetchCashpoolUserSettlementSummary() async {
    print("fetchCashpoolUserSettlementSummary");
    final cashpoolId = cashpool.value?.id;
    if (cashpoolId == null) return;
    print("fetchCashpoolUserSettlementSummary w cashpoolId: ${cashpoolId}");

    cashpoolUserSettlementSummary.value = await cashpoolSettlementService
        .getUserSettlementSummary(
          cashpoolId,
        );
    print("summary: ${cashpoolUserSettlementSummary.value}");
  }

  Future<void> showCreateTransactionSheet() async {
    Get.lazyPut(
      () => CashpoolCreateTransactionController(
        cashpoolTransactionService: cashpoolTransactionService,
      ),
    );

    final transaction = await Get.bottomSheet<CashpoolTransaction>(
      const CashpoolCreateTransactionSheet(),
      settings: RouteSettings(arguments: {"id": cashpool.value!.id}),
      backgroundColor: Get.theme.colorScheme.surface,
      isScrollControlled: true,
    );
    if (transaction != null) transactions.insert(0, transaction);
  }

  Future<void> handleItemPress(int i) async {
    if (transactions[i].owner.id != authService.user?.id &&
        authService.user?.isAdmin != true) {
      toastService.show(
        title: "Keine Berechtigung!",
        description:
            "Nur der Ersteller einer Transaktion darf diese bearbeiten.",
      );
      return;
    }

    Get.lazyPut(
      () => CashpoolCreateTransactionController(
        cashpoolTransactionService: cashpoolTransactionService,
      ),
    );

    final transaction = await Get.bottomSheet<CashpoolTransaction>(
      const CashpoolCreateTransactionSheet(),
      settings: RouteSettings(
        arguments: {"id": cashpool.value!.id, "transaction": transactions[i]},
      ),
      backgroundColor: Get.theme.colorScheme.surface,
      isScrollControlled: true,
    );
    if (transaction != null) {
      transactions
        ..removeAt(i)
        ..insert(i, transaction);
    }
  }

  void handleTotalAvgTogglePress() {
    isHeaderShowingTotal.value = !isHeaderShowingTotal.value;
  }

  Future<void> handleSettlePress() async {
    await Get.toNamed<void>(
      "/cashpools/details/settle",
      arguments: {"id": cashpool.value!.id},
    );
  }

  @override
  Future<void> close() async {
    super.dispose();
    await _transactionSubscription?.cancel();
  }
}
