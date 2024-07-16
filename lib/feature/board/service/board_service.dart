import 'package:injectable/injectable.dart';

import 'package:gamemuncheol_upstream/common/model/cursor_pagination.dart';

import 'package:gamemuncheol_upstream/core/resource/result.dart';
import 'package:gamemuncheol_upstream/core/resource/base_error.dart';
import 'package:gamemuncheol_upstream/common/model/common_response.dart';
import 'package:gamemuncheol_upstream/common/service/pagination_service.dart';

import 'package:gamemuncheol_upstream/feature/post/model/post.dart';
import 'package:gamemuncheol_upstream/feature/board/model/board_pagination_path.dart';
import 'package:gamemuncheol_upstream/feature/board/data/remote/board_repository.dart';

@injectable
class BoardService implements PaginationService<Post> {
  final BoardPaginationPath path;
  final BoardRepository _boardRepository;

  BoardService(
    @factoryParam this.path, {
    required BoardRepository boardRepository,
  }) : _boardRepository = boardRepository;

  @override
  Future<Result<CursorPagination<Post>>> paginate(int page,
      {int size = 10}) async {
    try {
      final CommonResponse<CursorPagination<Post>> feed =
          await _boardRepository.pagenate(page, size: size, path: path.name);

      return Success(
        feed.data!,
      );
    } catch (e) {
      print(e);
      return const Failure(
        CommonError.UN_KNOWN,
      );
    }
  }
}
