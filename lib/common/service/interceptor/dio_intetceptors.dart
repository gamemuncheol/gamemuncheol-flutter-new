import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:gamemuncheol_upstream/common/const/data.dart';
import 'package:gamemuncheol_upstream/core/app/auth/data/local/token_dao.dart';
import 'package:gamemuncheol_upstream/core/app/auth/model/token_response.dart';

@module
abstract class DioInterCeptors {
  @lazySingleton
  PrettyDioLogger get logInterceptor {
    return PrettyDioLogger(
        requestBody: true, requestHeader: true, responseBody: true);
  }

  @lazySingleton
  TokenInterceptor provideTokenInterceptor(TokenDao tokenDao) {
    return TokenInterceptor(tokenDao);
  }
}

class TokenInterceptor extends Interceptor {
  final TokenDao _tokenDao;

  TokenInterceptor(TokenDao tokenDao) : _tokenDao = tokenDao;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers["customURL"] != null) {
      options = options.copyWith(baseUrl: options.headers["customURL"]);
      options.headers.remove("accessToken");
    }

    if (options.headers["accessToken"] == "true") {
      options.headers.remove("accessToken");
      final String? accessToken =
          await _tokenDao.get(key: AppData.ACCESS_TOKEN_KEY);

      options.headers.addAll({"Authorization": "Bearer $accessToken"});
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    const refreshPath = "/open-api/members/renew";
    final refreshToken = await _tokenDao.get(key: AppData.REFRESH_TOKEN_KEY);
    final RequestOptions options = err.requestOptions;

    if (refreshToken == null) {
      return handler.reject(err);
    }

    final bool isStatus401 = err.response?.statusCode == 401;
    final bool isPathRefresh = err.requestOptions.path == refreshPath;

    if (isStatus401 && !isPathRefresh) {
      final dio = Dio();
      final String url = "${AppData.BASE_URL}$refreshPath";

      try {
        Response<dynamic> resp =
            await dio.post(url, data: {"refreshToken": refreshToken});

        final token = FullyAccessedToken.fromJson(resp.data["data"]);

        options.headers
            .addAll({"Authorization": "Bearer ${token.accessToken}"});

        await _tokenDao.save(
            key: AppData.ACCESS_TOKEN_KEY, value: token.accessToken);

        await _tokenDao.save(
            key: AppData.REFRESH_TOKEN_KEY, value: token.refreshToken);

        resp = await dio.fetch(options);

        return handler.resolve(resp);
      } on DioException catch (e) {
        return handler.reject(e);
      }
    }

    return handler.reject(err);
  }
}
