import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

class ShoreBirdUpdateService {
  static ShorebirdCodePush shorebirdCodePush = ShorebirdCodePush();
  static Future<bool> checkForUpdate() async {
    try {
      final isShorebirdAvailable = shorebirdCodePush.isShorebirdAvailable();
      if (isShorebirdAvailable) {
        EasyLoading.show(status: "Checking for update");
        final isUpdateAvailable =
            await shorebirdCodePush.isNewPatchAvailableForDownload();
        EasyLoading.showSuccess(isUpdateAvailable
            ? "Update is available downloading"
            : "No Update available");
        return isUpdateAvailable;
      }
      throw ("Service is not available");
    } catch (e) {
      EasyLoading.showError("Something went wrong");
      log(e.toString());
    }
    return false;
  }

  static Future<void> downloadUpdate() async {
    try {
      EasyLoading.show(status: "Downloading update");
      await shorebirdCodePush.downloadUpdateIfAvailable();
      EasyLoading.show(status: "Downloading successfully restarting in 3s");
      await Future.delayed(const Duration(seconds: 3));
      bool isRestart = await restartApplication();
      if (!isRestart) {
        EasyLoading.showError(
            "Unable to restart application,restart your application now");
      }
    } catch (e) {
      log(e.toString());
      EasyLoading.showError("Unable to download update");
    }
  }

  static Future<bool> restartApplication() async {
    return await Restart.restartApp();
  }
}
