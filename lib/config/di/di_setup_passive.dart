import 'package:get_it/get_it.dart';

import 'package:gamemuncheol_upstream/common/const/data.dart';

GetIt locator = GetIt.instance;

// 수동 등록
void setupLocator() {
  locator.registerSingleton<String>(AppData.BASE_URL, instanceName: "baseUrl");
}
