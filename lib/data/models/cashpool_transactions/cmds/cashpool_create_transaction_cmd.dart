import "package:diehugosapp/data/models/cashpool_transactions/requests/cashpool_create_transaction_request.dart";

class CashpoolTransactionCreateCmd {
  CashpoolTransactionCreateCmd({
    required this.label,
    required this.amountCents,
    required this.cashpoolId,
  });

  final String label;
  final int amountCents;
  final int cashpoolId;

  CashpoolTransactionCreateRequest toRequest() =>
      CashpoolTransactionCreateRequest(
        label: label,
        amountCents: amountCents,
      );
}
