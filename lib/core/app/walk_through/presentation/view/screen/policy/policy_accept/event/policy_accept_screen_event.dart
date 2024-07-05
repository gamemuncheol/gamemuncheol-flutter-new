import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol_upstream/core/app/walk_through/model/policys.dart';
import 'package:gamemuncheol_upstream/core/app/walk_through/presentation/provider/policy/policy_provider.dart';
import 'package:gamemuncheol_upstream/core/app/walk_through/presentation/provider/policy/policy_state.dart';
import 'package:gamemuncheol_upstream/core/app/walk_through/presentation/view/screen/policy/policy_accept/screen/policy_accept_screen.dart';
import 'package:gamemuncheol_upstream/core/app/walk_through/presentation/view/screen/policy/privacy_policy_summary/screen/policy_summary_screen.dart';

mixin PolicyAcceptScreenEvent on ConsumerState<PolicyAcceptScreen> {
  int _calPassCount() {
    int necessaryAcceptCount = 0;

    for (var policy in Policys.values) {
      if (policy.isNecessary) {
        necessaryAcceptCount++;
      }
    }

    return necessaryAcceptCount;
  }

  void seeSummary() async {
    final state = ref.read(policyNotifierProvider);

    final int totalCount = state.totalCount;
    final int unnecessaryAcceptCount = state.unnecessaryAcceptCount;

    switch (state.states) {
      case PolicyStates.allAccepted:
        context.pushReplacement(PolicySummaryScreen.PATH);

      case PolicyStates.necessaryOnly:
        if (totalCount == _calPassCount()) {
          context.pushReplacement(PolicySummaryScreen.PATH);
        }

      case PolicyStates.withUnnecessary:
        if (totalCount - unnecessaryAcceptCount == _calPassCount()) {
          context.pushReplacement(PolicySummaryScreen.PATH);
        }

      default:
        break;
    }

    // ignore: unused_result
    ref.refresh(policyNotifierProvider);
  }

  void listenGlobalEvent(
    WidgetRef ref, {
    required ValueNotifier<bool> isAccepted,
  }) {
    ref.listen(policyNotifierProvider, (previous, next) {
      if (next.states == PolicyStates.allAccepted) {
        isAccepted.value = true;
      } else if (next.states == PolicyStates.allRejected) {
        isAccepted.value = false;
      }
    });
  }

  void acceptALl() => ref.read(policyNotifierProvider.notifier).acceptAll();

  void rejectALl() => ref.read(policyNotifierProvider.notifier).rejectALl();

  void accept({
    required bool isUnNeccesary,
    required ValueNotifier<bool> isAccepted,
  }) {
    isAccepted.value = ref
        .read(policyNotifierProvider.notifier)
        .accept(isUnNeccesary: isUnNeccesary);
  }

  void reject({
    required bool isUnNeccesary,
    required ValueNotifier<bool> isAccepted,
  }) {
    isAccepted.value = ref
        .read(policyNotifierProvider.notifier)
        .reject(isUnnecessaryTerm: isUnNeccesary);
  }
}
