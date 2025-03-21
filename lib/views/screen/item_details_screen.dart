import 'package:ecommerce_userapp/controller/item/itemDeteils_controller.dart';
import 'package:ecommerce_userapp/core/class/api_manage_statuts_view.dart';
import 'package:ecommerce_userapp/core/constant/image_assets.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/core/function/translate_database.dart';
import 'package:ecommerce_userapp/views/widget/items/cart_button.dart';
import 'package:ecommerce_userapp/views/widget/items/color_list.dart';
import 'package:ecommerce_userapp/views/widget/items/image_and_item_name.dart';
import 'package:ecommerce_userapp/views/widget/items/price_and_count.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsScreen extends GetView<ItemDeteilsControllerImp> {
  const ItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ItemDeteilsControllerImp>(builder: (context) {
        return ApiManageStatutsRequest(
          statusRequest: controller.apiStatusRequest,
          widget: ListView(children: [
            ImageAndItemName(
              isFav: controller.itemModel.fevorite! == 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${translateDataBase(controller.itemModel.itemsNameAr, controller.itemModel.itemsName)}",
                          style: AppTextStyles.headingText24Black,
                        ),
                        if (controller.itemModel.itemsDiscount! > 0)
                          Image.asset(
                            AppAssets.discount,
                            width: 90,
                            fit: BoxFit.scaleDown,
                          ),
                      ],
                    ),
                    PriceAndCount(
                      onAdd: () {
                        controller.add();
                      },
                      onRemove: () {
                        controller.remove();
                      },
                      price:
                          controller.itemModel.itemsPriceDiscount!.toString(),
                      count: controller.itemCount.toString(),
                    ),
                    Text(
                      translateDataBase(controller.itemModel.itemsNameAr,
                              controller.itemModel.itemsName) *
                          20,
                      style: AppTextStyles.bodyContent16Gray,
                    ),
                    Text(
                      "Color",
                      style: AppTextStyles.headingText24Black,
                    ),
                    const ColorList(),
                  ]),
            ),
          ]),
        );
      }),
      bottomNavigationBar: CartButton(
        addToCart: () {
          controller.goToCart();
        },
      ),
    );
  }
}
