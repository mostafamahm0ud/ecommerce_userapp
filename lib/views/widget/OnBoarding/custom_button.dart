import 'package:ecommerce_userapp/controller/on_boarding_controller.dart';
import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOnBoardingButton extends GetView<OnBoardingControllerImp> {
  const CustomOnBoardingButton(
      {super.key, required this.color, this.buttonTo, this.textColor});

  final Color color;
  final String? buttonTo;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (buttonTo != null) {
          controller.onNext();
        } else {
          Get.offAllNamed(AppRoutes.signIn);
        }
      },
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: context.width * 0.7,
        alignment: Alignment.center,
        child: Text(
          buttonTo ?? 'Skip',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
