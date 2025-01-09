import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCardHome extends StatelessWidget {
  const ProductCardHome({
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
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Image.network(
            "${ApiLinks.imageProductEndpoint}/${item.itemsImage}",
            fit: BoxFit.cover,
            height: 130,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.itemsName!,
                    style: AppTextStyles.bodyContent16Black,
                  ),
                  Text(
                    "Price: ${item.itemsPrice!}\$",
                    style: AppTextStyles.bodyContent16Gray,
                  ),
                ],
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
