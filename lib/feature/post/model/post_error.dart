// ignore_for_file: constant_identifier_names

import 'package:gamemuncheol_upstream/core/resource/base_error.dart';

enum PostError implements BaseError {
  // 동영상 업로드 용량 초과
  BYTE_OVER_FLOW("최대 업로드 용량은 500MB입니다."),

  // 동영상 선택 취소
  VIDEO_NOT_SELECTED(""),

  // 썸네일 자동 추출 실패
  THUMB_IMAGE_INITIALIZE_FAILED(""),

  // 썸네일 선택 취소
  THUMB_IMAGE_NOT_SELECTED(""),

  // 지원하지 않는 파일 양식
  UNSUPPORTED_FILE("지원하지 않는 파일 양식입니다."),

  // 전적 검색 결과 없음
  NO_SUCH_MATCH("검색 결과가 존재하지 않습니다."),

  // 유튜브 URL 검색 결과 없음
  NO_SUCH_YOUTUBE_URL("존재하지 않는 유튜브 url입니다."),

  // 업로드 실패
  POST_FAILED("업로드 실패 잠시후 다시 시도해 주세요.");

  const PostError(this.message);

  @override
  final String message;
}
