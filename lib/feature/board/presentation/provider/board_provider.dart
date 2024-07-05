import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol_upstream/common/provider/pagination_provider.dart';
import 'package:gamemuncheol_upstream/config/di/di_setup_passive.dart';
import 'package:gamemuncheol_upstream/feature/board/model/board_pagination_path.dart';
import 'package:gamemuncheol_upstream/feature/board/service/board_service.dart';
import 'package:gamemuncheol_upstream/feature/post/model/post.dart';

class BoardNotifier extends PaginationNotifier<Post, BoardService> {
  BoardNotifier(super.paginationService);
}

final recentBoardNotifierProvider =
    NotifierProvider<BoardNotifier, PaginationState<Post>>(() {
  return BoardNotifier(locator<BoardService>(param1: BoardPaginationPath.NEW));
});

final homeBoardNotifierProvider =
    NotifierProvider<BoardNotifier, PaginationState<Post>>(() {
  return BoardNotifier(locator<BoardService>(param1: BoardPaginationPath.NEW));
});
