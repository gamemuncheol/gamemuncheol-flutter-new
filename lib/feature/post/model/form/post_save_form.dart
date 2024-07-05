import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_save_form.g.dart';
part 'post_save_form.freezed.dart';

@Freezed(toJson: true)
class PostSaveForm with _$PostSaveForm {
  const factory PostSaveForm({
    required String videoUrl,
    required String thumbnailUrl,
    required String title,
    required String content,
    required List<int> matchUserIds,
    required List<String> tags,
  }) = _PostSaveForm;

  factory PostSaveForm.fromJson(Map<String, dynamic> json) =>
      _$PostSaveFormFromJson(json);
}
