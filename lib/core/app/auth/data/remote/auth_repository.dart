import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import 'package:gamemuncheol_upstream/core/app/auth/model/sign_up_form.dart';
import 'package:gamemuncheol_upstream/core/app/auth/model/token_response.dart';

part 'auth_repository.g.dart';

@lazySingleton
@RestApi()
abstract class AuthRepository {
  @factoryMethod
  factory AuthRepository(
    Dio dio, {
    @Named("baseUrl") String baseUrl,
  }) = _AuthRepository;

  @POST("/open-api/members/register")
  Future<FullyAccessedToken> register(@Body() SignUpForm signUpForm);
}
