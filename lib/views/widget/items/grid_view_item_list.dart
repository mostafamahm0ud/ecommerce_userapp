import 'package:ecommerce_userapp/controller/item_controller.dart';
import 'package:ecommerce_userapp/data/model/items_model.dart';
import 'package:ecommerce_userapp/views/widget/items/item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridViewItemList extends GetView<ItemControllerImp> {
  const GridViewItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.items.length,
      itemBuilder: (context, index) {
        return ItemCard(
          item: ItemModel.fromJson(controller.items[index]),
        );
      },
    );
  }
}
