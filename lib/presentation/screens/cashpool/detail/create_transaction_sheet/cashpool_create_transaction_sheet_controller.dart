import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/data/models/cashpool_transactions/cashpool_transaction.dart";
import "package:diehugosapp/data/models/cashpool_transactions/cmds/cashpool_create_transaction_cmd.dart";
import "package:diehugosapp/services/cashpool_transaction_service.dart";
import "package:flutter/cupertino.dart";
import "package:get/get.dart";

class CashpoolCreateTransactionSheetController extends GetxController {
  CashpoolCreateTransactionSheetController({
    required this.cashpoolTransactionService,
  });

  late final CashpoolTransactionService cashpoolTransactionService;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Rx<UiState> state = UiState.loading().obs;
  final Rx<String> category = "expense".obs;
  final Rx<TextEditingValue> label = TextEditingValue.empty.obs;
  final Rx<TextEditingValue> amountCents = TextEditingValue.empty.obs;

  Future<void> handleCreateTransaction() async {
    if (!formKey.currentState!.validate()) return;
    state.value = UiState.loading();

    try {
      final cashpoolId = (Get.arguments as Map<String, int>)["id"];
      if (cashpoolId == null) {
        throw Exception("an id has to be passed to the bottom sheet!");
      }

      final isExpense = category.value == "expense";
      print(category.value);

      final amountEuros = int.tryParse(amountCents.value.text);
      if (amountEuros == null) return;

      final transaction = await cashpoolTransactionService.create(
        CashpoolTransactionCreateCmd(
          label: label.value.text,
          amountCents: amountEuros * 100 * (isExpense ? -1 : 1),
          cashpoolId: cashpoolId,
        ),
      );

      Get.back<CashpoolTransaction>(result: transaction);
    } on Exception catch (e) {
      print(e);
      state.value = UiState.error("Unable to create a transaction");
    }
    state.value = UiState.success();
  }

  String? validateLabelField(String? value) {
    if (value == null || value.isEmpty) return "Dieses Feld ist Pflicht!";
    if (value.length > 255) return "Die Eingabe ist zu lang!";
    return null;
  }

  String? validateAmountField(String? value) {
    if (value == null || value.isEmpty) return "Dieses Feld ist Pflicht!";
    if (int.parse(value) <= 0) return "Der Betrag muss positiv sein!";
    return null;
  }
}
