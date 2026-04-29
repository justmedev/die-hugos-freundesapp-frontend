import "package:diehugosapp/data/models/user/user.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "cashpool_transaction.freezed.dart";
part "cashpool_transaction.g.dart";

@freezed
abstract class CashpoolTransaction with _$CashpoolTransaction {
  const factory CashpoolTransaction({
    required int id,
    required DateTime createdAt,

    required String label,
    required int amountCents,
    required User owner,
  }) = _CashpoolTransaction;

  factory CashpoolTransaction.fromJson(Map<String, Object?> json) =>
      _$CashpoolTransactionFromJson(json);
}
