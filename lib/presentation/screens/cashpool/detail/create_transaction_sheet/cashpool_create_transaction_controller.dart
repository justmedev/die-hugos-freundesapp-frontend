import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/data/models/cashpool_transactions/cashpool_transaction.dart";
import "package:diehugosapp/data/models/cashpool_transactions/cmds/cashpool_create_transaction_cmd.dart";
import "package:diehugosapp/data/models/cashpool_transactions/cmds/cashpool_update_transaction_cmd.dart";
import "package:diehugosapp/services/cashpool_transaction_service.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class CashpoolCreateTransactionController extends GetxController {
  CashpoolCreateTransactionController({
    required this.cashpoolTransactionService,
  });

  late final CashpoolTransactionService cashpoolTransactionService;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Rx<UiState> state = UiState.loading().obs;
  final Rx<String> category = "expense".obs;
  final Rx<TextEditingValue> label = TextEditingValue.empty.obs;
  final Rx<TextEditingValue> amountCents = TextEditingValue.empty.obs;
  final Rxn<CashpoolTransaction> editingTransaction = Rxn();
  final RxBool isCreateOrEditBtnLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments as Map<String, Object>;
    if (arguments.containsKey("transaction")) {
      final transaction = arguments["transaction"]! as CashpoolTransaction;
      editingTransaction.value = transaction;
      category.value = transaction.amountCents < 0 ? "expense" : "income";
      amountCents.value = TextEditingValue(
        text: (transaction.amountCents.abs() / 100).toString(),
      );
      label.value = TextEditingValue(
        text: transaction.label,
      );
    }
  }

  Future<void> handleCreateOrEditTransaction() async {
    if (!formKey.currentState!.validate()) return;
    state.value = UiState.loading();

    try {
      final cashpoolId = (Get.arguments as Map<String, Object>)["id"] as int?;
      if (cashpoolId == null) {
        throw Exception("an id has to be passed to the bottom sheet!");
      }

      final isExpense = category.value == "expense";
      final amountEuros = double.tryParse(this.amountCents.value.text);
      if (amountEuros == null) return;
      final amountCents = amountEuros * 100 * (isExpense ? -1 : 1);

      CashpoolTransaction transaction;
      if (editingTransaction.value == null) {
        // We are not editing, create a new one
        transaction = await cashpoolTransactionService.create(
          CashpoolTransactionCreateCmd(
            label: label.value.text,
            amountCents: amountCents.round(),
            cashpoolId: cashpoolId,
          ),
        );
      } else {
        transaction = await cashpoolTransactionService.update(
          CashpoolTransactionUpdateCmd(
            label: label.value.text,
            amountCents: amountCents.round(),
            cashpoolId: cashpoolId,
            transactionId: editingTransaction.value!.id,
          ),
        );
      }

      Get.back<CashpoolTransaction>(result: transaction);
    } on Exception catch (e) {
      print(e);
      state.value = UiState.error("Unable to create_sheet a transaction");
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
    final n = double.tryParse(value);
    if (n == null) return "Der Betrag ist keine Dezimalzahl!";
    if (n <= 0) return "Der Betrag muss positiv sein!";
    return null;
  }
}
