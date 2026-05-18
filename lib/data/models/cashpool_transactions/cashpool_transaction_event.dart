import "package:diehugosapp/data/models/cashpool_transactions/cashpool_transaction.dart";
import "package:flutter/foundation.dart";

sealed class CashpoolTransactionEvent {
  const CashpoolTransactionEvent();

  factory CashpoolTransactionEvent.created(
    CashpoolTransaction transaction,
  ) => Created(transaction);

  factory CashpoolTransactionEvent.updated(
    CashpoolTransaction transaction,
  ) => Updated(transaction);

  factory CashpoolTransactionEvent.deleted(
    int transactionId,
    int emittingUserId,
  ) => Deleted(transactionId, emittingUserId);
}

@immutable
class Created extends CashpoolTransactionEvent {
  const Created(this.transaction);

  final CashpoolTransaction transaction;
}

@immutable
class Updated extends CashpoolTransactionEvent {
  const Updated(this.transaction);

  final CashpoolTransaction transaction;
}

@immutable
class Deleted extends CashpoolTransactionEvent {
  const Deleted(this.transactionId, this.emittingUserId);

  final int transactionId;
  final int emittingUserId;
}
