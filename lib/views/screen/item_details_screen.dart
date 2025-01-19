import 'package:ecommerce_userapp/controller/itemDeteils_controller.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/core/function/translate_database.dart';
import 'package:ecommerce_userapp/views/widget/items/add_to_cart_button.dart';
import 'package:ecommerce_userapp/views/widget/items/color_list.dart';
import 'package:ecommerce_userapp/views/widget/items/image_and_item_name.dart';
import 'package:ecommerce_userapp/views/widget/items/price_and_count.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsScreen extends GetView<ItemDeteilsControllerImp> {
  const ItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDeteilsControllerImp());
    return Scaffold(
      body: ListView(children: [
        ImageAndItemName(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${translateDataBase(controller.itemModel.itemsNameAr, controller.itemModel.itemsName)}",
                  style: AppTextStyles.headingText24Black,
                ),
                PriceAndCount(
                  onAdd: () {},
                  onRemove: () {},
                  price: controller.itemModel.itemsPrice.toString(),
                  count: "1",
                ),
                Text(
                  translateDataBase(controller.itemModel.itemsNameAr,
                          controller.itemModel.itemsName) *
                      70,
                  style: AppTextStyles.bodyContent16Gray,
                ),
                Text(
                  "Color",
                  style: AppTextStyles.headingText24Black,
                ),
                ColorList(),
              ]),
        ),
      ]),
      bottomNavigationBar: AddToCartButton(
        addToCart: () {},
      ),
    );
  }
}
