import 'package:ecommerce_userapp/controller/item_controller.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesItem extends GetView<ItemControllerImp> {
  const CategoriesItem({
    required this.slectedindex,
    super.key,
    required this.categoryModel,
  });
  final int? slectedindex;

  final CategoriesModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToProductsScreen(controller.categories, slectedindex!);
        controller.changeSelectedCategory(slectedindex! , categoryModel.categoriesId!.toString());
      },
      child: Column(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GetBuilder<ItemControllerImp>(builder: (controller) {
              return Container(
                decoration: BoxDecoration(
                  border: controller.selectedCategoryIndex == slectedindex!
                      ? Border(
                          bottom: BorderSide(
                              color: AppColors.primaryColor, width: 3))
                      : null,
                ),
                child: Text(categoryModel.categoriesName!,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyContent20Black),
              );
            }),
          ),
        ],
      ),
    );
  }
}
