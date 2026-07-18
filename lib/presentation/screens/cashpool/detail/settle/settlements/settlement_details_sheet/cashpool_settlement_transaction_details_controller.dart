import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/data/models/cashpool_settlement/cashpool_suggested_settlement.dart";
import "package:diehugosapp/data/models/cashpool_settlement/cmds/cashpool_settlement_create_cmd.dart";
import "package:diehugosapp/services/auth_service.dart";
import "package:diehugosapp/services/cashpool_settlement_service.dart";
import "package:diehugosapp/services/epc_qr_service.dart";
import "package:diehugosapp/services/toaster_service.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class CashpoolSettlementTransactionDetailsController extends GetxController {
  CashpoolSettlementTransactionDetailsController({
    required this.cashpoolSettlementService,
    required this.epcQrService,
    required this.toastService,
    required this.authService,
  });

  late final CashpoolSettlementService cashpoolSettlementService;
  late final EpcQrService epcQrService;
  late final ToastService toastService;
  late final AuthService authService;
  late final int cashpoolId;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Rx<UiState> state = UiState.loading().obs;
  final Rx<UiState> qrState = UiState.loading().obs;
  final Rx<TextEditingValue> purpose = const TextEditingValue(
    text: "DieHugos Zahlung",
  ).obs;
  final Rx<TextEditingValue> amountCents = TextEditingValue.empty.obs;
  final RxnString sepaCodeData = RxnString();
  final Rxn<CashpoolSuggestedSettlement> settlement = Rxn();

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;
    settlement.value = args["settlement"] as CashpoolSuggestedSettlement?;
    cashpoolId = args["cashpoolId"] as int;
    if (settlement.value == null) {
      state.value = UiState.error("No settlement found!");
      return;
    }

    amountCents.value = TextEditingValue(
      text: (settlement.value!.amountCents / 100.0).toString(),
    );
    computeQrCodeInfo();
  }

  void computeQrCodeInfo() {
    qrState.value = UiState.loading();
    final amountEurosParsed = double.tryParse(amountCents.value.text);
    final recv = settlement.value?.to;
    if (amountEurosParsed == null ||
        amountEurosParsed <= 0 ||
        settlement.value == null ||
        recv == null) {
      qrState.value = UiState.error();
      return;
    }

    if (recv.accountHolderName == null || recv.accountIBAN == null) {
      qrState.value = UiState.error("no_account_info");
      return;
    }

    sepaCodeData.value = epcQrService.generateEPCQrCodeDataV2(
      payeeName: recv.accountHolderName!,
      iban: recv.accountIBAN!,
      amountCents: (amountEurosParsed * 100).round(),
      purpose: purpose.value.isBlank == true
          ? "Diehugos Abrechnung"
          : purpose.value.text,
    );

    qrState.value = UiState.success();
  }

  String? validatePurposeField(String? value) {
    if (value == null || value.isEmpty) return "Dieses Feld ist Pflicht!";
    if (value.length > 255) return "Die Eingabe ist zu lang!";
    return null;
  }

  String? validateAmountField(String? value) {
    if (value == null || value.isEmpty) return "Dieses Feld ist Pflicht!";
    final n = double.tryParse(value);
    if (n == null) return "Der Betrag ist keine Dezimalzahl!";
    if (n <= 0) return "Der Betrag muss positiv sein!";
    return null;
  }

  bool get isSettleable =>
      settlement.value?.from.id == authService.user?.id &&
      settlement.value?.to.id != authService.user?.id;

  Future<void> handleSettleSettlementAction() async {
    if (formKey.currentState?.validate() != true) return;

    if (!isSettleable) {
      toastService.show(
        title: "Du darfst das nicht!",
        description: "Nur der zu Überweisende darf als überwiesen markieren.",
        icon: const Icon(FIcons.ban),
      );
      return;
    }

    state.value = UiState.loading();

    try {
      final amountEuros = double.tryParse(amountCents.value.text);
      if (amountEuros == null) {
        state.value = UiState.success();
        return;
      }
      final amountCentsInt = (amountEuros * 100).round();

      final cmd = CashpoolSettlementCreateCmd(
        cashpoolId: cashpoolId,
        fromUserId: settlement.value!.from.id,
        toUserId: settlement.value!.to.id,
        purpose: purpose.value.text.isEmpty
            ? "Diehugos Abrechnung"
            : purpose.value.text,
        amountCents: amountCentsInt,
      );

      await cashpoolSettlementService.create(cmd);

      toastService.show(
        title: "Überweisung eingetragen",
        description: "Die Überweisung wurde erfolgreich eingetragen.",
        icon: const Icon(FIcons.check),
      );

      Get.back(result: true);
    } on Exception catch (e) {
      debugPrint(e.toString());
      state.value = UiState.error("Unable to create settlement");
      toastService.show(
        title: "Fehler",
        description: "Die Überweisung konnte nicht eingetragen werden: $e",
        icon: const Icon(FIcons.ban),
      );
    }
  }
}
