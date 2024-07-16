import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol_upstream/feature/post/model/form/match_save_form_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/model/match_user.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/provider/search_match_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/screen/search_match_screen.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step2_select_stakeholder/screen/select_stakeholder_screen.dart';
import 'package:go_router/go_router.dart';

mixin SearchMatchScreenEvent on ConsumerState<SearchMatchScreen> {
  onLeadingTap() {
    ref.refresh(matchSaveFormNotifierProvider);
    context.pop();
  }

  search(String gameId) {
    ref.read(searchMatchNotifierProvider.notifier).search(gameId);
  }

  updateMe(MatchUser me) {
    ref.read(matchSaveFormNotifierProvider.notifier).updateMe(me);
  }

  selectStakeHolder() {
    context.pushNamed(SelectStakeHolderScreen.NAME);
  }
}
