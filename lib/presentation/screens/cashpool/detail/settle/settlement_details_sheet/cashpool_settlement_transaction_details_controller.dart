import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/data/models/cashpool_settlement/cashpool_suggested_settlement.dart";
import "package:diehugosapp/services/cashpool_settlement_service.dart";
import "package:diehugosapp/services/epc_qr_service.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class CashpoolSettlementTransactionDetailsController extends GetxController {
  CashpoolSettlementTransactionDetailsController({
    required this.cashpoolSettlementService,
    required this.epcQrService,
  });

  late final CashpoolSettlementService cashpoolSettlementService;
  late final EpcQrService epcQrService;

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
    settlement.value =
        (Get.arguments
            as Map<String, CashpoolSuggestedSettlement>)["settlement"];
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
    if (amountEurosParsed == null || settlement.value == null || recv == null) {
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
    qrState.value = UiState.error();
    if (value == null || value.isEmpty) return "Dieses Feld ist Pflicht!";
    final n = double.tryParse(value);
    if (n == null) return "Der Betrag ist keine Dezimalzahl!";
    if (n <= 0) return "Der Betrag muss positiv sein!";
    qrState.value = UiState.success();
    return null;
  }
}
