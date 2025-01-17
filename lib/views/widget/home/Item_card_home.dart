import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/data/model/items_model.dart';
import 'package:flutter/material.dart';

class ItemCardHome extends StatelessWidget {
  const ItemCardHome({
    super.key,
    required this.item,
  });
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: 8,
        children: [
          CachedNetworkImage(
            imageUrl: "${ApiLinks.imageProductEndpoint}/${item.itemsImage}",
            fit: BoxFit.cover,
            height: 110,
          ),
          Text(
            item.itemsName!,
            style: AppTextStyles.bodyContent16Black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Price: ${item.itemsPrice!}\$",
                style: AppTextStyles.bodyContent16Gray,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
