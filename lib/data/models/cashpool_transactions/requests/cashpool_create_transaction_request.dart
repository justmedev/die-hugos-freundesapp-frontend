import "package:freezed_annotation/freezed_annotation.dart";

part "cashpool_create_transaction_request.freezed.dart";
part "cashpool_create_transaction_request.g.dart";

@freezed
abstract class CashpoolTransactionCreateRequest
    with _$CashpoolTransactionCreateRequest {
  const factory CashpoolTransactionCreateRequest({
    required String label,
    required int amountCents,
  }) = _CashpoolTransactionCreateRequest;

  factory CashpoolTransactionCreateRequest.fromJson(
    Map<String, Object?> json,
  ) => _$CashpoolTransactionCreateRequestFromJson(json);
}
