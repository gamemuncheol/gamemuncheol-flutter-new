import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol_upstream/core/resource/base_state.dart';

import 'package:gamemuncheol_upstream/feature/post/model/match.dart';
import 'package:gamemuncheol_upstream/feature/post/model/match_user.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/provider/search_match_provider.dart';

final matchSaveFormNotifierProvider =
    NotifierProvider<MatchSaveFormNotifier, MatchSaveForm>(() {
  return MatchSaveFormNotifier();
});

class MatchSaveFormNotifier extends Notifier<MatchSaveForm> {
  @override
  MatchSaveForm build() {
    ref.listen(searchMatchNotifierProvider, (pre, next) {
      if (next is Value) {
        state = state.copyWith(match: next.valueOrNull);
      } else {
        state = MatchSaveForm();
      }
    });

    return MatchSaveForm();
  }

  void updateMatch(Match match) {
    state = state.copyWith(match: match);
  }

  void updateMe(MatchUser me) {
    state = state.copyWith(me: me);
  }

  void updateStakeHolder(MatchUser stakeHolder) {
    state = state.copyWith(stakeHolder: stakeHolder);
  }
}

class MatchSaveForm {
  final Match? match;
  final MatchUser? me;
  final MatchUser? stakeHolder;

  MatchSaveForm({this.match, this.me, this.stakeHolder});

  MatchSaveForm copyWith({
    Match? match,
    MatchUser? me,
    MatchUser? stakeHolder,
  }) {
    return MatchSaveForm(
      match: match ?? this.match,
      me: me ?? this.me,
      stakeHolder: stakeHolder ?? this.stakeHolder,
    );
  }
}
