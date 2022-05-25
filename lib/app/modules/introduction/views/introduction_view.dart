import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Quran Digital',
                style: light.textTheme.headline1,
    
              ),
              Text(
                'Mengingatkan Waktu Sholat Anda',
                style: light.textTheme.subtitle1,
                // style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              SizedBox(
                  width: 300,
                  height: 300,
                  child: Lottie.asset("assets/lottie/muslim_read_quran.json")),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                height: 55,
                child: ElevatedButton(
                  onPressed: () => Get.offAllNamed(Routes.HOME),
                  style: ElevatedButton.styleFrom(
                      primary: primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "Memulai",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
