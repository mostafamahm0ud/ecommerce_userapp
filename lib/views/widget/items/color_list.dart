import 'package:ecommerce_userapp/controller/item/itemDeteils_controller.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorList extends GetView<ItemDeteilsControllerImp> {
  const ColorList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(spacing: 15, children: [
      ...List.generate(
        controller.subItems.length,
        (index) => Container(
          alignment: Alignment.center,
          height: 60,
          width: 90,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(10),
            color: controller.subItems[index]["active"] == 1
                ? AppColors.secondaryBlue
                : AppColors.white,
          ),
          child: Text(
            "${controller.subItems[index]["name"]}",
            style: controller.subItems[index]["active"] == 1
                ? AppTextStyles.bodyContent16White
                : AppTextStyles.bodyContent16Black,
          ),
        ),
      )
    ]);
  }
}
