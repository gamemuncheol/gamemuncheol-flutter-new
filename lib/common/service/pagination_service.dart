import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol_upstream/core/resource/result.dart';
import 'package:gamemuncheol_upstream/common/model/cursor_pagination.dart';
import 'package:gamemuncheol_upstream/common/component/pagination_list_view.dart';

abstract class PaginationService<T> {
  Future<Result<CursorPagination<T>>> paginate(int page, {int size = 20});
}

mixin PaginationHelper on ConsumerState<PaginationListview> {
  AnimationController get controller;
  int get standard;

  void fetchMore() {
    if (ref.read(widget.provider).hasValue) {
      return;
    }
    
    ref.read(widget.provider.notifier).paginate(refresh: false);
  }

  void refresh() {
    ref.read(widget.provider.notifier).paginate(refresh: true);
  }

  bool onNotification(ScrollNotification notification) {
    if (notification.metrics.pixels < -(standard * 0.5)) {
      controller.value = notification.metrics.pixels.abs() / 200;
    } else {
      controller.value = 0;
    }

    if (notification.metrics.pixels >= standard) {
      final bool isScrollEnd =
          notification.metrics.pixels == notification.metrics.maxScrollExtent;

      if (isScrollEnd) {
        ref.read(widget.provider.notifier).paginate(refresh: false);
      }
    }

    return true;
  }
}
