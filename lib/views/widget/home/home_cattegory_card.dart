import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/controller/home_controller.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/core/function/translate_database.dart';
import 'package:ecommerce_userapp/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesCardHome extends GetView<HomeControllerImp> {
  const CategoriesCardHome({
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
        controller.goToProductsScreen(controller.categories, slectedindex!,
            categoryModel.categoriesId.toString());
      },
      child: Column(
        spacing: 5,
        children: [
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: AppColors.grayOpen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              "${ApiLinks.imageCategoriesEndpoint}/${categoryModel.categoriesImage}",
              fit: BoxFit.cover,
            ),
          ),
          Text(
              "${translateDataBase(categoryModel.categoriesNameAr, categoryModel.categoriesName)}",
              style: AppTextStyles.bodyContent16Gray),
        ],
      ),
    );
  }
}
