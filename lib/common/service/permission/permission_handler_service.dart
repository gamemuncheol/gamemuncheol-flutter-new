import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerService {
  PermissionHandlerService._();

  static final PermissionHandlerService _instance =
      PermissionHandlerService._();

  factory PermissionHandlerService() {
    return _instance;
  }

  static Future<bool> request(
    Permission permission, {
    required Function()? onDeniedCallback,
    required Function()? onGrantedCallback,
  }) async {
    permission
        .onDeniedCallback(onDeniedCallback)
        .onPermanentlyDeniedCallback(onDeniedCallback)
        .onGrantedCallback(onGrantedCallback)
        .onLimitedCallback(onGrantedCallback)
        .onRestrictedCallback(onGrantedCallback);

    PermissionStatus permissionStatus = await permission.request();
    return permissionStatus.isDenied || permissionStatus.isPermanentlyDenied;
  }

  static Future<bool> checkPermission(Permission permission) async {
    bool hasPermission = await permission.isGranted ||
        await permission.isRestricted ||
        await permission.isLimited;

    return hasPermission;
  }
}
