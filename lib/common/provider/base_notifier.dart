import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol_upstream/core/resource/base_state.dart';
import 'package:gamemuncheol_upstream/core/resource/result.dart';

class BaseNotifier<T> extends Notifier<BaseState<T>> {
  @override
  BaseState<T> build() {
    throw UnimplementedError();
  }

  Future<void> notify({
    required Future<Result<T>> Function() action,
  }) async {
    state = Loading();

    final Result<T> result = await action();

    result.when(
        success: (data) => state = Value(valueOrNull: data),
        failure: (err) => state = Error(error: err));
  }
}
