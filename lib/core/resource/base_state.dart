import 'package:gamemuncheol_upstream/core/resource/base_error.dart';

abstract class LoadingWithMessgeState {
  final String? message;
  LoadingWithMessgeState({this.message});
}

abstract class BaseState<T> extends LoadingWithMessgeState {
  BaseState({super.message});

  T? get valueOrNull;

  T get value => valueOrNull!;
  bool get hasValue => this.valueOrNull != null;

  BaseError get error => (this as Error).error;

  bool get isInital => this is Initial;
  bool get isLoading => this is Loading;
  bool get isError => this is Error;

  R when<R>({
    R Function()? initial,
    R Function(String message)? error,
    R Function()? loading,
    // 로딩 메시지가 필요한 경우 사용
    R Function(String message)? loadingWithMessage,
    R Function(T value)? value,
    R Function()? orElse,
  }) {
    if (isInital && initial != null) {
      return initial();
    } else if (isError && error != null) {
      return error(this.error.message);
    } else if (isLoading && loading != null) {
      return loading();
    } else if (isLoading && loadingWithMessage != null && message != null) {
      return loadingWithMessage(message!);
    } else if (hasValue && value != null) {
      return value(this.value);
    } else {
      return orElse!();
    }
  }
}

class Initial<T> extends BaseState<T> {
  @override
  T? get valueOrNull => null;
}

class Loading<T> extends BaseState<T> {
  final T? cache;
  Loading({this.cache, super.message});

  @override
  T? get valueOrNull => cache;
}

class Error<T> extends BaseState<T> {
  final T? cache;

  @override
  final BaseError error;

  Error({this.cache, required this.error});

  @override
  T? get valueOrNull => cache;
}

class Value<T> extends BaseState<T> {
  @override
  final T? valueOrNull;

  Value({this.valueOrNull});
}


// abstract class StateMapper<T> {
//   // pState 사용 전까지만 초기화하면 됨
//   late final T pState;

//   // 로딩, 에러 상태로 바뀌었을 때 이전 pState를 보존하고 있는지 여부
//   bool hasCache = false;

//   StateMapper();
//   factory StateMapper.init() => Init();

//   // 로딩, 에러 상태에 pState를 보존하는 메서드
//   StateMapper<T> withCache(StateMapper<T> newState) {
//     if (this.isPState || this.hasCache) {
//       newState.pState = this.pState;
//       newState.hasCache = true;
//     }

//     return newState;
//     //
//   }

//   bool get isPState => this is T;
//   bool get isInit => this is Init;
//   bool get isError => this is Error;
//   bool get isLoading => this is Loading;

//   String get loadingMessage => (this as Loading).message;
//   String get errorMessage => (this as Error).error.message;

//   R allState<R>({
//     R Function()? initial,
//     R Function(String message)? error,
//     R Function()? loading,
//     // 로딩 메시지가 필요한 경우 사용
//     R Function(String message)? loadingWithMessage,
//     R Function(T pState)? pState,
//     R Function()? orElse,
//   }) {
//     if (isInit && initial != null) {
//       return initial();
//     } else if (isError && error != null) {
//       return error(errorMessage);
//     } else if (isLoading && loading != null) {
//       return loading();
//     } else if (isLoading && loadingWithMessage != null) {
//       return loadingWithMessage(loadingMessage);
//     } else if (isPState && pState != null) {
//       return pState(this.pState);
//     } else {
//       return orElse!();
//     }
//   }
// }

// // 기본 상태
// class Init<T> extends StateMapper<T> {}

// // 기본 상태
// class Error<T> extends StateMapper<T> {
//   final BaseError error;
//   Error(this.error);
// }

// // 기본 상태
// class Loading<T> extends StateMapper<T> {
//   final String message;
//   Loading({this.message = ""});
// }

// // 함수 하나 호출 등등 간단한 상태관리에 사용
// class SingleData<T> extends StateMapper<SingleData<T>> {
//   final T data;
//   SingleData({required this.data});

//   @override
//   SingleData<T> get pState => this;
// }
