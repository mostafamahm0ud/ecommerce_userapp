import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/controller/favorite/favorite_controller.dart';
import 'package:ecommerce_userapp/controller/item/item_controller.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/constant/image_assets.dart';
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
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 3,
              children: [
                Hero(
                  tag: "${item.itemsId}",
                  child: CachedNetworkImage(
                    imageUrl:
                        "${ApiLinks.imageItemsEndpoint}/${item.itemsImage}",
                    fit: BoxFit.scaleDown,
                    height: 80,
                  ),
                ),
                Text(
                  item.itemsName!,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyContent20Black,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Rate: 4",
                        style: AppTextStyles.bodyContent16Primary,
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
                              // color: Colors.amber,
                              size: 16,
                            ),
                          ),
                        ]),
                      )
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price: ${item.itemsPriceDiscount!}\$",
                      style: AppTextStyles.bodyContent16Black,
                    ),
                    GetBuilder<FavoriteControllerImp>(
                        builder: (conrtrollerfav) {
                      return IconButton(
                        onPressed: () {
                          if (conrtrollerfav
                                  .favorite[item.itemsId.toString()] ==
                              "1") {
                            conrtrollerfav.updateFavorite(
                                item.itemsId.toString(), "0");
                            conrtrollerfav
                                .removeFromFavorite(item.itemsId.toString());
                          } else {
                            conrtrollerfav.updateFavorite(
                                item.itemsId.toString(), "1");
                            conrtrollerfav
                                .addToFavorite(item.itemsId.toString());
                          }
                        },
                        icon: Icon(
                            conrtrollerfav.favorite[item.itemsId.toString()] ==
                                    "1"
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red),
                      );
                    }),
                  ],
                ),
              ],
            ),
            if (item.itemsDiscount! > 0)
              Positioned(
                  top: 4,
                  left: 4,
                  child: Image.asset(
                    AppAssets.discount,
                    width: 70,
                  )),
          ]),
        ),
      ),
    );
  }
}
