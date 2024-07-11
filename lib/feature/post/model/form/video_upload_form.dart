import 'dart:typed_data';

class VideoUploadForm {
  final String videoUrl;
  final Uint8List? thumbnail;

  VideoUploadForm({required this.videoUrl, this.thumbnail});

  VideoUploadForm copyWith({
    String? videoUrl,
    Uint8List? thumbnail,
  }) {
    return VideoUploadForm(
      videoUrl: videoUrl ?? this.videoUrl,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }
}
