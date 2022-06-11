import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/constants/constants.dart';
import 'app/controllers/setting_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  Get.put(SettingController(),permanent: true);

    return GetMaterialApp(
      theme: light,
      darkTheme: dark,
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,  
    );
  }
}
