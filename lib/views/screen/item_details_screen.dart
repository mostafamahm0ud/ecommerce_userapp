import 'package:ecommerce_userapp/controller/itemDeteils_controller.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsScreen extends GetView<ItemDeteilsControllerImp> {
  const ItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDeteilsControllerImp());
    return Scaffold(
      body: Container(
        child: ListView(children: [
          Stack(children: [
            Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ))
          ])
        ]),
      ),
    );
  }
}
