import 'package:injectable/injectable.dart';

import 'di_setup_auto.config.dart';

import 'package:gamemuncheol_upstream/config/di/di_setup_passive.dart';

@injectableInit
Future<void> configureDependencies() async => locator.init();
