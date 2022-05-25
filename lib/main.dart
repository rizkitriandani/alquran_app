import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/constants/constants.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: light,
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: Routes.INTRODUCTION,
      getPages: AppPages.routes,  
    ),
  );
}
