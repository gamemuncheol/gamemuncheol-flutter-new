enum PolicyStates {
  initial,
  allAccepted,
  allRejected,
  necessaryOnly,
  withUnnecessary,
}

class PolicyState {
  final PolicyStates states;
  final int totalCount;
  final int unnecessaryAcceptCount;

  PolicyState({
    required this.states,
    this.totalCount = 0,
    this.unnecessaryAcceptCount = 0,
  });
}
