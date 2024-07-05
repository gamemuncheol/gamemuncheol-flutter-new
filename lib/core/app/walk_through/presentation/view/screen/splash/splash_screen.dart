import 'package:flutter/material.dart';
import 'package:gamemuncheol_upstream/feature/member/presentation/provider/member_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol_upstream/common/layout/home/layout/home_layout.dart';
import 'package:gamemuncheol_upstream/common/component/loading_indicator.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/provider/auth_provider.dart/auth_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  static const PATH = "/";
  static const NAME = "SplashScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.microtask(() async {
      await ref.read(authNotifierProvider.notifier).init().then((value) async =>
          value
              ? await ref.read(memberNotifierProvider.notifier).userMe()
              : null);
    }).whenComplete(() {
      context.pushReplacement(HomeLayout.PATH);
    });

    return const Scaffold(
      body: Center(
        child: LoadingIndicator(),
      ),
    );
  }
}
