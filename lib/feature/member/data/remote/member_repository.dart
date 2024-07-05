import 'package:dio/dio.dart' hide Headers;
import 'package:gamemuncheol_upstream/core/app/auth/model/sign_up_form.dart';
import 'package:gamemuncheol_upstream/core/app/auth/model/token_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'package:gamemuncheol_upstream/common/model/common_response.dart';
import 'package:gamemuncheol_upstream/feature/member/model/member.dart';

part 'member_repository.g.dart';

abstract class MemberRepository {
  Future<CommonResponse<bool>> checkDuplicatedNickname(String nickname);
  Future<CommonResponse<FullyAccessedToken>> register(SignUpForm signUpForm);
  Future<CommonResponse> changeNickname(String nickname);
  Future<CommonResponse<Member>> me();
}

@LazySingleton(as: MemberRepository)
class MemberRepositoryImpl implements MemberRepository {
  final Dio _dio;
  final String _baseUrl;
  final MemberRepositoryImplProxy _retrofit;

  MemberRepositoryImpl({
    required Dio dio,
    @Named("baseUrl") required String baseUrl,
    required MemberRepositoryImplProxy retrofit,
  })  : _dio = dio,
        _baseUrl = baseUrl,
        _retrofit = retrofit;

  @override
  Future<CommonResponse<bool>> checkDuplicatedNickname(String nickname) {
    return _retrofit.checkDuplicatedNickname(nickname);
  }

  @override
  Future<CommonResponse<FullyAccessedToken>> register(
      SignUpForm signUpForm) async {
    final resp = await _dio.post(
      "$_baseUrl/open-api/members/register",
      options: Options(
        headers: Map.from(
          {"Content-Type": "application/json"},
        ),
      ),
      data: signUpForm.toJson(),
    );

    final CommonResponse<FullyAccessedToken> pResp =
        CommonResponse<FullyAccessedToken>(
      success: true,
      status: CommonResponseStatus.fromJson(
          resp.data["status"] as Map<String, dynamic>),
      data: FullyAccessedToken.fromJson(
          resp.data["data"] as Map<String, dynamic>),
    );

    return pResp;
  }

  @override
  Future<CommonResponse> changeNickname(String nickname) {
    return _retrofit.changeNickname(nickname);
  }

  @override
  Future<CommonResponse<Member>> me() {
    return _retrofit.me();
  }
}

@lazySingleton
@RestApi()
abstract class MemberRepositoryImplProxy {
  @factoryMethod
  factory MemberRepositoryImplProxy(
    Dio dio, {
    @Named("baseUrl") String baseUrl,
  }) = _MemberRepositoryImplProxy;

  @GET("/open-api/members/nickname/{nickname}")
  Future<CommonResponse<bool>> checkDuplicatedNickname(@Path() String nickname);

  @Headers({"accessToken": "true"})
  @PATCH("/api/members/nickname/{nickname}")
  Future<CommonResponse> changeNickname(@Path() String nickname);

  @Headers({"accessToken": "true"})
  @GET("/api/members/me")
  Future<CommonResponse<Member>> me();
}
