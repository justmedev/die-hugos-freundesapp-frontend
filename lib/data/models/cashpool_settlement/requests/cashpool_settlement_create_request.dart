import "package:freezed_annotation/freezed_annotation.dart";

part "cashpool_settlement_create_request.freezed.dart";
part "cashpool_settlement_create_request.g.dart";

@freezed
abstract class CashpoolSettlementCreateRequest
    with _$CashpoolSettlementCreateRequest {
  const factory CashpoolSettlementCreateRequest({
    required int fromId,
    required int toId,
    required int amountCents,
    required String purpose,
  }) = _CashpoolSettlementCreateRequest;

  factory CashpoolSettlementCreateRequest.fromJson(
    Map<String, Object?> json,
  ) => _$CashpoolSettlementCreateRequestFromJson(json);
}
