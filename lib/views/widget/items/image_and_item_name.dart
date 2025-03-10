import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/controller/favorite/favorite_controller.dart';
import 'package:ecommerce_userapp/controller/item/itemDeteils_controller.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageAndItemName extends GetView<ItemDeteilsControllerImp> {
  const ImageAndItemName({
    required this.isFav,
    super.key,
  });

  final bool isFav;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 160,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        Hero(
          tag: "${controller.itemModel.itemsId}",
          child: Positioned(
            top: 50,
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                child: CachedNetworkImage(
                  imageUrl:
                      "${ApiLinks.imageItemsEndpoint}/${controller.itemModel.itemsImage}",
                  fit: BoxFit.scaleDown,
                  height: 160,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 10,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
              color: AppColors.white,
              size: 30,
            ),
          ),
        ),
        GetBuilder<FavoriteControllerImp>(builder: (controllerfav) {
          return Positioned(
            right: 10,
            top: 10,
            child: IconButton(
              onPressed: () {
                if (controllerfav
                        .favorite[controller.itemModel.itemsId.toString()] ==
                    "1") {
                  controllerfav
                      .favorite[controller.itemModel.itemsId.toString()] = "0";
                  controllerfav.removeFromFavorite(
                      controller.itemModel.itemsId.toString());
                } else {
                  controllerfav
                      .favorite[controller.itemModel.itemsId.toString()] = "1";
                  controllerfav
                      .addToFavorite(controller.itemModel.itemsId.toString());
                }
              },
              icon: Icon(
                controllerfav.favorite[
                                controller.itemModel.itemsId.toString()] ==
                            "1" ||
                      isFav == true
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.red,
                size: 30,
              ),
            ),
          );
        }),
      ],
    );
  }
}
