import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:image_picker/image_picker.dart';

import 'package:gamemuncheol_upstream/core/resource/media_model.dart';

@module
abstract class ImagePickerModule {
  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();
}

@lazySingleton
class ImagePickerService {
  final ImagePicker _imagePicker;

  ImagePickerService({required ImagePicker imagePicker})
      : _imagePicker = imagePicker;

  /**
   * 갤러리에서 이미지 선택 로직 
   */
  Future<MediaModel?> pickImageFromGallery({required int? maxByte}) async {
    final XFile? xfile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    return _toMediaModel(xFile: xfile, maxByte: maxByte);
  }

  /**
   * 갤러리에서 동영상 선택 로직 
   */
  Future<MediaModel?> pickVideoFromGallery({required int? maxByte}) async {
    final XFile? xfile =
        await _imagePicker.pickVideo(source: ImageSource.gallery);

    return _toMediaModel(xFile: xfile, maxByte: maxByte);
  }

  /**
   * 파일 사이즈 계산 로직
   */
  Future<double> _calculateFileSize(File file) async {
    final int fileSizeInBytes = await file.length();
    final double fileSizeInMB = fileSizeInBytes / (1024 * 1024);

    return fileSizeInMB;
  }

  /**
   * 미디어 모델로 변환 로직
   */
  Future<MediaModel?> _toMediaModel({XFile? xFile, int? maxByte}) async {
    //
    // 파일 선택을 안 한 경우
    if (xFile == null) {
      return null;
    }

    final File file = File(xFile.path);
    if (maxByte != null) {
      // 파일 사이즈가 안 맞는 경우
      if (await _calculateFileSize(file) > maxByte) {
        return MediaModel(file: null);
      }
    }

    // 정상적인 경우
    return MediaModel(file: file);
  }
}
