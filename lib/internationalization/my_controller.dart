import 'dart:ui';
import 'package:get/get.dart';

class MyController extends GetxController {
  void changeLanguage(var lang, var country) {
    var locale = Locale(lang, country);
    Get.updateLocale(locale);
  }
}
