import 'package:ecommerce_userapp/controller/on_boarding_controller.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/views/widget/OnBoarding/custom_button.dart';
import 'package:ecommerce_userapp/views/widget/OnBoarding/custom_dot_control.dart';
import 'package:ecommerce_userapp/views/widget/OnBoarding/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 2,
              child: CustomSlider(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const CustomDotController(),
                  const Spacer(flex: 2),
                  CustomOnBoardingButton(
                    buttonTo: "8".tr,
                    color: AppColors.primaryColor,
                  ),
                  CustomOnBoardingButton(
                    // textColor: AppColors.primaryColor,
                    color: AppColors.gray,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
