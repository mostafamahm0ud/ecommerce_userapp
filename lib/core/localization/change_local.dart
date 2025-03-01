import 'package:ecommerce_userapp/core/constant/app_theme_data.dart';
import 'package:ecommerce_userapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("language", langCode);
    appTheme = langCode == 'ar' ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Get.snackbar("Warrning", 'Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("Warrning", 'Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("Warrning",
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  void onInit() {
    requestPerLocation();
    String? savedLanguage = myServices.sharedPreferences.getString("language");
    if (savedLanguage == "ar") {
      language = Locale("ar");
      appTheme = themeArabic;
      Get.updateLocale(Locale("ar"));
    } else if (savedLanguage == "en") {
      language = Locale("en");
      appTheme = themeEnglish;
      Get.updateLocale(Locale("en"));
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
