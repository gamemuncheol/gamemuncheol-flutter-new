import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:gamemuncheol_upstream/common/service/interceptor/dio_intetceptors.dart';

@module
abstract class AppNetworkClient {
  @lazySingleton
  Dio dio(PrettyDioLogger logInterceptor, TokenInterceptor tokenInterceptor) {
    final Dio dio = Dio();

    dio.interceptors.add(tokenInterceptor);
    dio.interceptors.add(logInterceptor);

    return dio;
  }
}
