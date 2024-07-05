import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol_upstream/core/app/walk_through/presentation/provider/policy/policy_state.dart';

final policyNotifierProvider =
    NotifierProvider<PolicyNotifier, PolicyState>(() {
  return PolicyNotifier();
});

class PolicyNotifier extends Notifier<PolicyState> {
  @override
  PolicyState build() => PolicyState(states: PolicyStates.initial);

  void acceptAll() {
    state = PolicyState(states: PolicyStates.allAccepted);
  }

  void rejectALl() {
    state = PolicyState(states: PolicyStates.allRejected);
  }

  // 개별 항목 동의
  bool accept({required bool isUnNeccesary}) {
    // 필수 항목을 동의한 경우
    if (!isUnNeccesary) {
      // 이미 선택 항목 동의가 되어있는 경우
      if (state.states == PolicyStates.withUnnecessary) {
        state = PolicyState(
          totalCount: state.totalCount + 1,
          unnecessaryAcceptCount: state.unnecessaryAcceptCount,
          states: PolicyStates.withUnnecessary,
        );
        // 필수 항목만 동의 되어있는 경우
      } else {
        state = PolicyState(
          totalCount: state.totalCount + 1,
          states: PolicyStates.necessaryOnly,
        );
      }
      // 선택 항목을 동의한 경우
    } else {
      // 이미 선택 항목 동의가 되어있는 경우
      if (state.states == PolicyStates.withUnnecessary) {
        state = PolicyState(
          totalCount: state.totalCount + 1,
          unnecessaryAcceptCount: state.unnecessaryAcceptCount + 1,
          states: PolicyStates.withUnnecessary,
        );

        // 필수 항목만 동의 되어있는 경우
      } else {
        state = PolicyState(
          totalCount: state.totalCount + 1,
          unnecessaryAcceptCount: state.unnecessaryAcceptCount + 1,
          states: PolicyStates.withUnnecessary,
        );
      }
    }

    return true;
  }

  // 개별 항목 동의 취소
  bool reject({required bool isUnnecessaryTerm}) {
    // 필수 항목 동의를 취소한 경우
    if (!isUnnecessaryTerm) {
      // 이미 선택 항목 동의가 되어있는 경우
      if (state.states == PolicyStates.withUnnecessary) {
        state = PolicyState(
          totalCount: state.totalCount - 1,
          unnecessaryAcceptCount: state.unnecessaryAcceptCount,
          states: PolicyStates.withUnnecessary,
        );
        // 필수 항목만 동의 되어있는 경우
      } else {
        state = PolicyState(
          totalCount: state.totalCount - 1,
          states: PolicyStates.necessaryOnly,
        );
      }
      // 선택 항목 동의를 취소한 경우
    } else {
      if (state.unnecessaryAcceptCount == 1) {
        state = PolicyState(
          totalCount: state.totalCount - 1,
          states: PolicyStates.necessaryOnly,
        );
      } else {
        state = PolicyState(
          totalCount: state.totalCount - 1,
          unnecessaryAcceptCount: state.unnecessaryAcceptCount - 1,
          states: PolicyStates.withUnnecessary,
        );
      }
    }

    return false;
  }
}
