import "package:freezed_annotation/freezed_annotation.dart";

part "cashpool_create_cmd.freezed.dart";
part "cashpool_create_cmd.g.dart";

@freezed
abstract class CashpoolCreateCmd with _$CashpoolCreateCmd {
  const factory CashpoolCreateCmd({
    required String title,
    required String description,
  }) = _CashpoolCreateCmd;

  factory CashpoolCreateCmd.fromJson(Map<String, Object?> json) =>
      _$CashpoolCreateCmdFromJson(json);
}
