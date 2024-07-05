import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol_upstream/common/service/redirect_service.dart';
import 'package:gamemuncheol_upstream/common/util/system_util.dart';
import 'package:gamemuncheol_upstream/common/util/theme_provider.dart';
import 'package:gamemuncheol_upstream/config/di/di_setup_auto.dart';
import 'package:gamemuncheol_upstream/config/di/di_setup_passive.dart';
import 'package:gamemuncheol_upstream/config/router/go_router.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/theme_generator.dart';
import 'package:gamemuncheol_upstream/config/theme/manager/theme_manger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "app_config.env");
  await configureDependencies();
  setupLocator();

  final Brightness brightness = MediaQueryData.fromView(
    WidgetsBinding.instance.platformDispatcher.views.first,
  ).platformBrightness;

  // final ThemeEnum initialTheme =
  //     brightness == Brightness.dark ? ThemeEnum.dark : ThemeEnum.light;

  // 다크 모드는 아직 없음
  const ThemeEnum initialTheme = ThemeEnum.light;

  runApp(
    ProviderScope(
      overrides: [
        themeProvider.overrideWith((ref) => ThemeManagerImpl(initialTheme)),
      ],
      child: MyApp(
        brightness: brightness,
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  final Brightness brightness;
  const MyApp({super.key, required this.brightness});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemUtil.setDefaultSystemUiMode();
    SystemUtil.setWhiteThemeSystemUiMode();

    const double deviceWidth = 390;
    const double deviceHeight = 844;

    final ThemeManger theme = ref.watch(themeProvider);

    final GoRouter router = ref.read(
        goRouterProvider(redirectService: ref.read(redirectServiceProvider)));

    return ScreenUtilInit(
      designSize: const Size(
        deviceWidth,
        deviceHeight,
      ),
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: router,
          theme: theme.currentTheme,
          builder: (context, child) {
            ThemeUtil.init(context);
            return child!;
          },
        );
      },
    );
  }
}
