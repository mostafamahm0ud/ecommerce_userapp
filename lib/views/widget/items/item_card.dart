import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/controller/item_controller.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class ItemCard extends GetView<ItemControllerImp> {
  const ItemCard({
    super.key,
    required this.item,
  });
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemDetails(item);
      },
      child: Card(
        elevation: 0,
        color: const Color.fromARGB(1, 0, 0, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              Hero(
                tag: "${item.itemsId}",
                child: CachedNetworkImage(
                  imageUrl: "${ApiLinks.imageProductEndpoint}/${item.itemsImage}",
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ),
              Text(
                item.itemsName!,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyContent20Black,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Rate: 4",
                      style: AppTextStyles.bodyContent16Gray,
                      textAlign: TextAlign.start,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 20,
                      child: Row(children: [
                        ...List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                        ),
                      ]),
                    )
                  ]),
              // Text(
              //   item.itemsDescribtion!,
              //   textAlign: TextAlign.start,
              //   style: AppTextStyles.bodyContent16Gray,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Price: ${item.itemsPrice!}\$",
                    style: AppTextStyles.bodyContent20Black,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
