import 'package:ecommerce_userapp/controller/home/home_controller.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/data/model/categories_model.dart';
import 'package:ecommerce_userapp/views/widget/home/home_cattegory_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesHomeListView extends GetView<HomeControllerImp> {
  const CategoriesHomeListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: AppTextStyles.bodyContent20Black,
            ),
            TextButton(
              onPressed: () {
                controller.goToCategoriesScreen();
              },
              child: Text(
                'See all',
                style: AppTextStyles.bodyContent16Primary,
              ),
            ),
          ],
        ),
        Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.separated(
            itemCount: controller.categories.length,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              CategoriesModel category =
                  CategoriesModel.fromJson(controller.categories[index]);
              return CategoriesCardHome(
                slectedindex: index,
                categoryModel: category,
              );
            },
          ),
        ),
      ],
    );
  }
}
