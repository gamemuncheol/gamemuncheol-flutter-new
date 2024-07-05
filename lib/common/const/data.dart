import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppData {
  /**
   * 시큐어 스토리지
   * 엑세스 토큰 키
   * 리프레시 토큰 키
   */
  static final String TEMP_TOKEN_KEY = dotenv.env["REFRESH_TOKEN_KEY"]!;
  static final String ACCESS_TOKEN_KEY = dotenv.env["ACCESS_TOKEN_KEY"]!;
  static final String REFRESH_TOKEN_KEY = dotenv.env["REFRESH_TOKEN_KEY"]!;

  // game-muncheol-api 베이스
  static final String BASE_URL = dotenv.env["BASE_URL"]!;

  // oauth용 flutter-web 주소
  static final String OAUTH_WAS_URL = dotenv.env["OAUTH_WAS_URL"]!;

/**
 * oauth 이후 앱으로 돌아올 때 쿼리 파람으로 들어오는 키값
 * 
 * QUERY_PARAM_TEMPO_KEY = 임시 키
 * QUERY_PARAM_ACCESSTOKEN_KEY = 엑세스 토큰 키
 * QUERY_PARAM_REFRESHTOKEN_KEY = 리프레시 토큰 키
 */
  static final String QUERY_PARAM_TEMPO_KEY =
      dotenv.env["OAUTH_REDIRECT_QUERY_PARAM_TEMPO_KEY"]!;
  static final String QUERY_PARAM_ACCESSTOKEN_KEY =
      dotenv.env["OAUTH_REDIRECT_QUERY_PARAM_ACCESSTOKEN_KEY"]!;
  static final String QUERY_PARAM_REFRESHTOKEN_KEY =
      dotenv.env["OAUTH_REDIRECT_QUERY_PARAM_REFRESHTOKEN_KEY"]!;

  // 애플 로그인 나운스
  static final String NOUNCE = "${dotenv.env["NOUNCE"]!}#";
}
