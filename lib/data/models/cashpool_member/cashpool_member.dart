import "package:diehugosapp/data/models/user/user.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "cashpool_member.freezed.dart";
part "cashpool_member.g.dart";

@freezed
abstract class CashpoolMember with _$CashpoolMember {
  const factory CashpoolMember({
    required int id,
    required User user,
    required DateTime createdAt,
  }) = _CashpoolMember;

  factory CashpoolMember.fromJson(Map<String, Object?> json) =>
      _$CashpoolMemberFromJson(json);
}
