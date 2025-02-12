import 'package:ecommerce_userapp/controller/home/home_controller.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/data/model/items_model.dart';
import 'package:ecommerce_userapp/views/widget/home/Item_card_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductHomeListView extends GetView<HomeControllerImp> {
  const ProductHomeListView({
    super.key,
    required this.sectiontitle,
  });
  final String sectiontitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              sectiontitle,
              style: AppTextStyles.bodyContent20Black,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See all',
                style: AppTextStyles.bodyContent16Primary,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              ItemModel item = ItemModel.fromJson(controller.items[index]);
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ItemCardHome(
                  item: item,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
