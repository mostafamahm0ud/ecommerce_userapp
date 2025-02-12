import 'package:ecommerce_userapp/controller/item/item_controller.dart';
import 'package:ecommerce_userapp/data/model/categories_model.dart';
import 'package:ecommerce_userapp/views/widget/items/category_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItem extends GetView<ItemControllerImp> {
  const ListCategoriesItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
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
          return CategoriesItem(
            slectedindex: index,
            categoryModel: category,
          );
        },
      ),
    );
  }
}
