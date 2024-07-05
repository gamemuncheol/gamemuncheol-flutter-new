import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol_upstream/common/component/loading_indicator.dart';
import 'package:gamemuncheol_upstream/common/provider/pagination_provider.dart';
import 'package:gamemuncheol_upstream/common/service/pagination_service.dart';

typedef PaginationWidgetBuilder<T> = Widget Function(int index, T model);

class PaginationListview<T> extends ConsumerStatefulWidget {
  final NotifierProvider<PaginationNotifier, PaginationState> provider;
  final PaginationWidgetBuilder<T> paginationWidgetBuilder;

  const PaginationListview({
    super.key,
    required this.provider,
    required this.paginationWidgetBuilder,
  });

  @override
  ConsumerState<PaginationListview> createState() =>
      _PaginationListviewState<T>();
}

class _PaginationListviewState<T> extends ConsumerState<PaginationListview>
    with SingleTickerProviderStateMixin, PaginationHelper {
  /**
   * 새로고침 기준, 
   * -100 픽셀보다 더 땡기면 새로고침!
   */
  @override
  final int standard = 100;

  @override
  AnimationController get controller => _controller;
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 300,
    ),
  )..addListener(() {
      if (_controller.value == 1) {
        refresh();
      }
    });

  late final Animation<double> _opacityAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

  @override
  void initState() {
    super.initState();
    Future.microtask(fetchMore);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(widget.provider);

    return Stack(
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: onNotification,
          child: ListView.builder(
            cacheExtent: 50000,
            physics: const BouncingScrollPhysics(),
            itemCount: state.hasValue ? state.value.data.length + 1 : 1,
            itemBuilder: (context, index) {
              if (state.hasValue) {
                if (state.value.data.length == index) {
                  if (state.isError &&
                      state.error == PaginationError.PAGE_DRIED) {
                    return Center(
                      child: Text(
                        state.error.message,
                      ),
                    );
                  }

                  return const Center(
                    child: LoadingIndicator(),
                  );
                }

                return widget.paginationWidgetBuilder(
                    index, state.value.data[index]);
              }

              return const Padding(
                padding: EdgeInsets.only(
                  top: 30,
                ),
                child: Center(
                  child: LoadingIndicator(),
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 30,
          left: 0,
          right: 0,
          child: AnimatedBuilder(
            animation: _opacityAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _opacityAnimation.value,
                child: child,
              );
            },
            child: const Center(
              child: LoadingIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}
