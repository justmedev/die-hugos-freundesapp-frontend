import "package:diehugosapp/data/models/cashpool_transactions/requests/cashpool_update_transaction_request.dart";

class CashpoolTransactionUpdateCmd {
  CashpoolTransactionUpdateCmd({
    required this.label,
    required this.amountCents,
    required this.cashpoolId,
    required this.transactionId,
  });

  final String label;
  final int amountCents;
  final int cashpoolId;
  final int transactionId;

  CashpoolTransactionUpdateRequest toRequest() =>
      CashpoolTransactionUpdateRequest(
        label: label,
        amountCents: amountCents,
      );
}
