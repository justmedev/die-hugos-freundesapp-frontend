import "package:freezed_annotation/freezed_annotation.dart";

part "cashpool_create_request.freezed.dart";
part "cashpool_create_request.g.dart";

@freezed
abstract class CashpoolCreateRequest with _$CashpoolCreateRequest {
  const factory CashpoolCreateRequest({
    required String title,
    required String description,
  }) = _CashpoolCreateRequest;

  factory CashpoolCreateRequest.fromJson(Map<String, Object?> json) =>
      _$CashpoolCreateRequestFromJson(json);
}
