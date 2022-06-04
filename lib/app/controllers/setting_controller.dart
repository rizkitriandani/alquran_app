import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class SettingController extends GetxController {
  bool isDark = false;

  void toggleDarkMode() {
    isDark = !isDark;
    if (isDark) {
      Get.changeTheme(dark);
    } else {
      Get.changeTheme(light);
    }
    update();
  }

  
}
