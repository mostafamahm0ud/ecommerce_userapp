import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/controller/favorite/my_favorite_controller.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/data/model/my_favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class MyFavoriteItemCard extends GetView<MyFavoriteControllerImp> {
  const MyFavoriteItemCard({
    super.key,
    required this.item,
  });
  final MyFavoriteModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color.fromARGB(1, 0, 0, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 5,
          children: [
            CachedNetworkImage(
              imageUrl: "${ApiLinks.imageItemsEndpoint}/${item.itemsImage}",
              fit: BoxFit.cover,
              height: 100,
            ),
            Text(
              item.itemsName!,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyContent20Black,
            ),
            Text(
              item.itemsDescribtion!,
              style: AppTextStyles.bodyContent16Gray,
              textAlign: TextAlign.start,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Price: ${item.itemsPrice!}\$",
                  style: AppTextStyles.bodyContent20Black,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    controller.deleteFavoriteData(item.favoriteId.toString());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
