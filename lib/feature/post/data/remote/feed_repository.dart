import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'package:gamemuncheol_upstream/common/model/common_response.dart';
import 'package:gamemuncheol_upstream/feature/post/model/post.dart';
import 'package:gamemuncheol_upstream/feature/post/model/form/post_save_form.dart';
import 'package:gamemuncheol_upstream/feature/post/model/match.dart';

part 'feed_repository.g.dart';

abstract class FeedRepository {
  Future<CommonResponse<Match>> search(String gameId);
  Future<HttpResponse<List<int>>> getYoutubeThumbImage(String youtubeId);
  Future<String> uploadVideo(File videoFile);
  Future<String> uploadThumbImage(File thumbImageFile);
  Future<CommonResponse<Post>> post(PostSaveForm feedForm);
}

@LazySingleton(as: FeedRepository)
class FeedRepositoryImpl implements FeedRepository {
  final Dio _dio;
  final String _baseUrl;
  final FeedRepositoryImplProxy _retrofit;

  FeedRepositoryImpl({
    required Dio dio,
    @Named("baseUrl") required String baseUrl,
    required FeedRepositoryImplProxy retrofit,
  })  : _dio = dio,
        _baseUrl = baseUrl,
        _retrofit = retrofit;

  @override
  Future<CommonResponse<Match>> search(String gameId) async {
    return _retrofit.search(gameId);
  }

  @override
  Future<HttpResponse<List<int>>> getYoutubeThumbImage(String youtubeId) async {
    return _retrofit.getYoutubeThumbImage(youtubeId);
  }

  @override
  Future<String> uploadVideo(File videoFile) async {
    final String url = "$_baseUrl/api/files/video";

    final part = await MultipartFile.fromFile(
      videoFile.path,
      filename: videoFile.path
          .split(
            Platform.pathSeparator,
          )
          .last,
      contentType: MediaType(
        "video",
        "mp4",
      ),
    );

    final response = await _dio.post(
      url,
      data: FormData.fromMap({
        "file": part,
      }),
      options: Options(
        headers: {
          "accessToken": "true",
          "Content-Type": "multipart/form-data",
        },
      ),
    );

    return response.data;
  }

  @override
  Future<String> uploadThumbImage(File thumbImageFile) async {
    final String url = "$_baseUrl/api/files/thumbnail";

    final part = await MultipartFile.fromFile(
      thumbImageFile.path,
      filename: thumbImageFile.path
          .split(
            Platform.pathSeparator,
          )
          .last,
      contentType: MediaType(
        "image",
        "jpeg",
      ),
    );

    final response = await _dio.post(
      url,
      data: FormData.fromMap({
        "file": part,
      }),
      options: Options(
        headers: {
          "accessToken": "true",
          "Content-Type": "multipart/form-data",
        },
      ),
    );

    return response.data;
  }

  @override
  Future<CommonResponse<Post>> post(PostSaveForm feedForm) {
    return _retrofit.post(feedForm);
  }
}

@lazySingleton
@RestApi()
abstract class FeedRepositoryImplProxy implements FeedRepository {
  @factoryMethod
  factory FeedRepositoryImplProxy(
    Dio dio, {
    @Named("baseUrl") String baseUrl,
  }) = _FeedRepositoryImplProxy;

  @override
  @Headers({"accessToken": "true"})
  @GET("/api/riot/search-matches/{gameId}")
  Future<CommonResponse<Match>> search(@Path() String gameId);

  @override
  @Headers({"customURL": "https://img.youtube.com/vi"})
  @GET("/{youtubeId}/0.jpg")
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> getYoutubeThumbImage(
      @Path() String youtubeId);

  @override
  @Headers({"accessToken": "true"})
  @POST("/api/files/video-upload")
  @MultiPart()
  Future<String> uploadVideo(@Part() File videoFile);

  @override
  @Headers({"accessToken": "true"})
  @POST("/api/files/thumbnail-upload")
  @MultiPart()
  Future<String> uploadThumbImage(
      @Part(name: "file", contentType: 'image/jpg') File thumbImageFile);

  @override
  @Headers({"accessToken": "true", "Content-Type": "application/json"})
  @POST("/api/posts")
  Future<CommonResponse<Post>> post(@Body() PostSaveForm feedForm);
}
