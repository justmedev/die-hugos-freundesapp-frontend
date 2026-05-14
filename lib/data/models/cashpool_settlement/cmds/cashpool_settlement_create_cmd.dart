import "package:diehugosapp/data/models/cashpool_settlement/requests/cashpool_settlement_create_request.dart";

class CashpoolSettlementCreateCmd {
  CashpoolSettlementCreateCmd({
    required this.cashpoolId,
    required this.fromUserId,
    required this.toUserId,
    required this.purpose,
    required this.amountCents,
  });

  final int cashpoolId;
  final int fromUserId;
  final int toUserId;
  final String purpose;
  final int amountCents;

  CashpoolSettlementCreateRequest toRequest() =>
      CashpoolSettlementCreateRequest(
        fromId: fromUserId,
        toId: toUserId,
        amountCents: amountCents,
        purpose: purpose,
      );
}
