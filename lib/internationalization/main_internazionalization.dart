import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ripples_code_getx/internationalization/message.dart';
import 'package:ripples_code_getx/internationalization/my_controller.dart';

class Main_Internazionalization extends StatelessWidget {
  MyController myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      home: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: () => SafeArea(
            child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("hello".tr),
                ElevatedButton(
                    onPressed: () {
                      myController.changeLanguage("en", "US");
                    },
                    child: const Text("English")),
                ElevatedButton(
                    onPressed: () {
                      myController.changeLanguage("ar", "DZ");
                    },
                    child: const Text("عربي")),
                ElevatedButton(
                    onPressed: () {
                      myController.changeLanguage("fr", "FR");
                    },
                    child: const Text("Français")),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
