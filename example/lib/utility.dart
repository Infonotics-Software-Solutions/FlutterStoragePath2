import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Utils{

  Future<bool> requestStoragePermission() async {
    DeviceInfoPlugin plugin = DeviceInfoPlugin();

    if(Platform.isAndroid) {
      AndroidDeviceInfo android = await plugin.androidInfo;
      if (android.version.sdkInt < 33) {
        if (await Permission.storage.request().isGranted) {
          debugPrint("Permission Granted True 13");
          return true;
        } else if (await Permission.storage.request().isPermanentlyDenied) {
          await openAppSettings();
        } else if (await Permission.storage.request().isDenied) {
          debugPrint("Permission Granted False 13");
          return false;
        }
      } else {
        if (await Permission.photos.request().isGranted ) {
          debugPrint("Permission Granted True");
          return true;
        } else if (await Permission.photos.request().isPermanentlyDenied) {
          await openAppSettings();
        } else if (await Permission.photos.request().isDenied) {
          debugPrint("Permission Granted False");
          return false;
        }
      }
    } else if(Platform.isIOS) {
      if (await Permission.storage.request().isGranted ) {
        debugPrint("Permission Granted True iOS");
        return true;
      } else if (await Permission.storage.request().isPermanentlyDenied) {
         await openAppSettings();
      } else if (await Permission.storage.request().isDenied) {
        debugPrint("Permission Granted False iOS");
        return false;
      }
    }
    return true;
  }


}