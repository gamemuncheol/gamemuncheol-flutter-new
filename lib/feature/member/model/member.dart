import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.g.dart';
part 'member.freezed.dart';

@freezed
class Member with _$Member {
  const factory Member({
    required String name,
    required String nickname,
    required String email,
    required String picture,
    required bool privacyAgreed,
    required double score,
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}
