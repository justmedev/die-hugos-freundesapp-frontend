import "package:freezed_annotation/freezed_annotation.dart";

part "cashpool_update_transaction_request.freezed.dart";
part "cashpool_update_transaction_request.g.dart";

@freezed
abstract class CashpoolTransactionUpdateRequest
    with _$CashpoolTransactionUpdateRequest {
  const factory CashpoolTransactionUpdateRequest({
    required String label,
    required int amountCents,
  }) = _CashpoolTransactionUpdateRequest;

  factory CashpoolTransactionUpdateRequest.fromJson(
    Map<String, Object?> json,
  ) => _$CashpoolTransactionUpdateRequestFromJson(json);
}
