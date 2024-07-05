// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol_upstream/common/model/cursor_pagination.dart';
import 'package:gamemuncheol_upstream/common/service/pagination_service.dart';
import 'package:gamemuncheol_upstream/core/resource/base_error.dart';
import 'package:gamemuncheol_upstream/core/resource/base_state.dart';

import 'dart:async';

class PaginationNotifier<T, K extends PaginationService<T>>
    extends Notifier<PaginationState<T>> {
  final K paginationService;
  DateTime? _lastPaginateCall;
  final Duration defaultThrottleDuration;

  PaginationNotifier(this.paginationService,
      {this.defaultThrottleDuration = const Duration(seconds: 2)});

  @override
  PaginationState<T> build() => Initial();

  bool _shouldThrottle(Duration throttleDuration) {
    final now = DateTime.now();
    if (_lastPaginateCall != null &&
        now.difference(_lastPaginateCall!) < throttleDuration) {
      return true;
    }
    _lastPaginateCall = now;
    return false;
  }

  Future<void> paginate({
    required bool refresh,
    Duration? throttleDuration,
  }) async {
    if (_shouldThrottle(throttleDuration ?? defaultThrottleDuration)) {
      return;
    }

    // 첫 fetch
    if (state is Initial || refresh) {
      state = Loading();

      final pages = await paginationService.paginate(1);

      pages.when(
        success: (pages) {
          state = Value(valueOrNull: pages);
        },
        failure: (error) {
          state = Error(error: error);
        },
      );

      return;
    }

    if (state is Value) {
      state = Loading(cache: state.valueOrNull);

      final int currentPage = state.value.page;
      final int totalPages = state.value.totalPages;

      final int rests = totalPages - currentPage;

      if (rests != 0) {
        final pages = await paginationService.paginate(
          currentPage + 1,
        );

        pages.when(
          success: (pages) {
            state = Value(
              valueOrNull: pages.copyWith(data: [
                ...state.value.data,
                ...pages.data,
              ]),
            );
          },
          failure: (error) {
            state = Error(
              cache: state.valueOrNull,
              error: error,
            );
          },
        );

        return;
      }

      state = Error(
        cache: state.valueOrNull,
        error: PaginationError.PAGE_DRIED,
      );
    }
  }
}

enum PaginationError implements BaseError {
  // 더 이상 페이지가 없을 때
  PAGE_DRIED("마지막 페이지");

  const PaginationError(this.message);

  @override
  final String message;
}

typedef PaginationState<T> = BaseState<CursorPagination<T>>;
