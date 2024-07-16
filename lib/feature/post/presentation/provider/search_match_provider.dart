import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol_upstream/common/provider/base_notifier.dart';
import 'package:gamemuncheol_upstream/config/di/di_setup_passive.dart';
import 'package:gamemuncheol_upstream/core/resource/base_state.dart';
import 'package:gamemuncheol_upstream/feature/post/model/match.dart';
import 'package:gamemuncheol_upstream/feature/post/service/post_service.dart';

final searchMatchNotifierProvider =
    NotifierProvider<SearchMatchNotifier, BaseState<Match>>(() {
  return SearchMatchNotifier(postService: locator<PostService>());
});

class SearchMatchNotifier extends BaseNotifier<Match> {
  final PostService _postService;

  SearchMatchNotifier({required PostService postService})
      : _postService = postService;

  @override
  BaseState<Match> build() => Initial();

  Future<void> search(String gameId) async {
    notify(action: () => _postService.search(gameId));
  }
}
