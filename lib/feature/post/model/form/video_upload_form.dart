import 'dart:typed_data';

class VideoUploadForm {
  final String videoUrl;
  final Uint8List? byteThumbImage;

  VideoUploadForm({required this.videoUrl, this.byteThumbImage});
}
