import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol_upstream/feature/post/model/form/match_save_form_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/model/match_user.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step2_select_stakeholder/screen/select_stakeholder_screen.dart';
import 'package:go_router/go_router.dart';

mixin SelecTStakeHolderScreenEvent on ConsumerState<SelectStakeHolderScreen> {
  ValueNotifier<bool> get inMyTeam;
  onLeadingTap() {
    context.pop();
  }

  updateStakeHolder(MatchUser stakeHolder) {
    ref
        .read(matchSaveFormNotifierProvider.notifier)
        .updateStakeHolder(stakeHolder);
  }

  selectInTeam() {
    inMyTeam.value = true;
  }

  selectInEnenmy() {
    inMyTeam.value = false;
  }
}
