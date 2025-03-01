import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/data/model/items_model.dart';
import 'package:flutter/material.dart';
class SearchCard extends StatelessWidget {
  const SearchCard({
    super.key,
    required this.items,
    required this.onTap,
  });

  final ItemModel items;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        child: Row(children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: "${ApiLinks.imageItemsEndpoint}/${items.itemsImage}",
              fit: BoxFit.scaleDown,
              height: 70,
            ),
          ),
          Expanded(
            flex: 2,
            child: ListTile(
              title: Text(
                items.itemsName!,
                style: AppTextStyles.bodyContent16Black,
              ),
              subtitle: Text(
                '${items.itemsPrice} EGP',
                style: AppTextStyles.bodyContent12Gray,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
