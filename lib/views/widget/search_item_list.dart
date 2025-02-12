import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/controller/search_controller.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchItemList extends GetView<SearchControllerImp> {
  const SearchItemList({super.key, required this.items});
  final List<ItemModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              controller.goToItemDetails(items[index]);
            },
            child: Row(children: [
              Expanded(
                child: CachedNetworkImage(
                    imageUrl:
                        "${ApiLinks.imageItemsEndpoint}/${items[index].itemsImage}",
                    fit: BoxFit.scaleDown,
                    height: 70),
              ),
              Expanded(
                flex: 2,
                child: ListTile(
                  title: Text(
                    items[index].itemsName!,
                    style: AppTextStyles.bodyContent16Black,
                  ),
                  subtitle: Text(
                    '${items[index].itemsPrice} EGP',
                    style: AppTextStyles.bodyContent12Gray,
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
