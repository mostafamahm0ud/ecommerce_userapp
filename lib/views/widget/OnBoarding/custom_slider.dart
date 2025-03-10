import 'package:ecommerce_userapp/controller/on_boarding_controller.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/data/dataSource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSlider extends GetView<OnBoardingControllerImp> {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(builder: (context) {
      return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.onChangePage(value);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(
                onBoardingList[index].title,
                style: AppTextStyles.headingText24Black,
              ),
              const SizedBox(height: 40),
              Image.asset(onBoardingList[index].image,
                  height: 200, width: 200, fit: BoxFit.fill),
              const SizedBox(height: 40),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  onBoardingList[index].description,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyContent16Gray,
                ),
              )
            ],
          );
        },
      );
    });
  }
}
