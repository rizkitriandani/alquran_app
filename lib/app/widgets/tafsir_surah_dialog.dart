import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../controllers/setting_controller.dart';
import '../data/models/surah.dart';

class SurahTafsirView extends StatelessWidget {
  final Surah surah;

  SurahTafsirView({super.key, required this.surah});

  final settingController = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    final double dialogHeight = Get.height * 0.7;
    final double dialogWidth = Get.width * 0.8;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: dialogWidth,
           constraints: BoxConstraints(
              minHeight: 100, minWidth: 100, maxWidth: dialogWidth, maxHeight: dialogHeight),
          decoration: BoxDecoration(
            color: settingController.isDark ? accentDark : white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text('Tafsir ${surah.name!.transliteration!.id}', style: settingController.isDark ? dark.textTheme.headline1!.copyWith(fontSize: 22) : light.textTheme.headline1!.copyWith(fontSize: 22),),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
                  child: Text(
                    surah.tafsir?.id ?? "Tidak ada tafsir",
                    textAlign: TextAlign.left,
                    style: basedFont.copyWith(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
