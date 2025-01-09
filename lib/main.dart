import 'package:ecommerce_userapp/binding.dart';
import 'package:ecommerce_userapp/core/localization/change_local.dart';
import 'package:ecommerce_userapp/core/localization/translation.dart';
import 'package:ecommerce_userapp/core/services/services.dart';
import 'package:ecommerce_userapp/routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices();
  runApp(
    DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(),)
    // const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslations(),
      locale: localeController.language,
      theme: localeController.appTheme,
      debugShowCheckedModeBanner: false,
      // initialRoute: AppRoutes.selectLanguage,
      initialBinding: MyBinding(),
      // routes: routes,
      getPages: route,
    );
  }
}
