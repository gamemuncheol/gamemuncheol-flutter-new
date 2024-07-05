abstract class BaseError implements Exception {
  final String message;
  BaseError(this.message);
}

enum CommonError implements BaseError {
  // 이유를 알 수 없을 때
  UN_KNOWN("알 수 없는 오류가 발생했습니다. 잠시후 다시 시도해 주세요 ㅠ");

  const CommonError(this.message);

  @override
  final String message;
}
