import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_form.g.dart';
part 'sign_up_form.freezed.dart';

@Freezed(toJson: true)
class SignUpForm with _$SignUpForm {
  factory SignUpForm({
    required String temporaryKey,
    required String nickname,
    required bool privacyAgree,
  }) = _SignUpForm;

  factory SignUpForm.fromJson(Map<String, dynamic> json) =>
      _$SignUpFormFromJson(json);
}
