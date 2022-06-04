// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../controllers/setting_controller.dart';
import '../routes/app_pages.dart';
import '../utils/logger.dart';

class NavDrawer extends StatelessWidget {
  var settingC = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: const Icon(Icons.info, color: primary),
            title: const Text('About Developer'),
            onTap: () => Get.toNamed(Routes.ABOUT),
          ),
          ListTile(
            leading: const Text("Dark Mode"),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetBuilder<SettingController>(
                  builder: (settingC) => FlutterSwitch(
                    width: 70.0,
                    height: 35.0,
                    toggleSize: 25.0,
                    value: settingC.isDark,
                    borderRadius: 30.0,
                    padding: 2.0,
                    activeToggleColor: const Color(0xFF6E40C9),
                    inactiveToggleColor: const Color(0xFF2F363D),
                    activeSwitchBorder: Border.all(
                      color: const Color(0xFF3C1E70),
                      width: 6.0,
                    ),
                    inactiveSwitchBorder: Border.all(
                      color: const Color(0xFFD1D5DA),
                      width: 6.0,
                    ),
                    activeColor: const Color(0xFF271052),
                    inactiveColor: Colors.white,
                    activeIcon: const Icon(
                      Icons.nightlight_round,
                      color: Color(0xFFF8E3A1),
                    ),
                    inactiveIcon: const Icon(
                      Icons.wb_sunny,
                      color: Color(0xFFFFDF5D),
                    ),
                    onToggle: (val) {
                      logger.d("isDarkMode : $val");
                      settingC.toggleDarkMode();

                      // if (settingC.isDark.value) {
                      //   _textColor = Colors.white;
                      //   _appBarColor = Color.fromRGBO(22, 27, 34, 1);
                      //   _scaffoldBgcolor = Color(0xFF0D1117);
                      // } else {
                      //   _textColor = Colors.black;
                      //   _appBarColor = Color.fromRGBO(36, 41, 46, 1);
                      //   _scaffoldBgcolor = Colors.white;
                      // }
                    },
                  ),
                )
                // Container(
                //   alignment: Alignment.centerRight,
                //   child: Text("Value: $status7"),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
