import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/core/localization/change_local.dart';
import 'package:ecommerce_userapp/views/widget/language/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectLanguageScreen extends GetView<LocaleController> {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              '1'.tr,
              style: AppTextStyles.headingText24Black,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomSelectLanguageButton(onPressed: () {
              controller.changeLanguage('en');
              Get.offNamed(AppRoutes.onBoarding);
            }),
            CustomSelectLanguageButton(
              onPressed: () {
                controller.changeLanguage('ar');
                Get.offNamed(AppRoutes.onBoarding);
              },
              buttonTo: 'Arabic',
              color: AppColors.gray,
              // textColor: AppColors.primaryColor,
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
