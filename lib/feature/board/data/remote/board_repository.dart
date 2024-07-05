import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:injectable/injectable.dart';

import 'package:gamemuncheol_upstream/feature/post/model/post.dart';
import 'package:gamemuncheol_upstream/common/model/common_response.dart';
import 'package:gamemuncheol_upstream/common/model/cursor_pagination.dart';

part 'board_repository.g.dart';

abstract class BoardRepository {
  Future<CommonResponse<CursorPagination<Post>>> pagenate(int page,
      {int size = 10, required String path});
}

@LazySingleton(as: BoardRepository)
@RestApi()
abstract class BoardRepositoryImpl implements BoardRepository {
  @factoryMethod
  factory BoardRepositoryImpl(
    Dio dio, {
    @Named("baseUrl") String baseUrl,
  }) = _BoardRepositoryImpl;

  @GET("/open-api/posts/page/{path}")
  @override
  Future<CommonResponse<CursorPagination<Post>>> pagenate(
    @Query("page") int page, {
    @Query("size") int size = 10,
    @Path() required String path,
  });
}
