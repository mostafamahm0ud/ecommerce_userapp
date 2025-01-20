import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/controller/favorite_controller.dart';
import 'package:ecommerce_userapp/controller/itemDeteils_controller.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageAndItemName extends GetView<ItemDeteilsControllerImp> {
  const ImageAndItemName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        Hero(
          tag: "${controller.itemModel.itemsId}",
          child: Positioned(
            top: 40,
            child: Center(
              child: CachedNetworkImage(
                imageUrl:
                    "${ApiLinks.imageProductEndpoint}/${controller.itemModel.itemsImage}",
                fit: BoxFit.cover,
                height: 200,
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
            icon: Icon(
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
                if (controllerfav.favorite[controller.itemModel.itemsId.toString()] ==
                    "1") {
                  controllerfav.favorite[controller.itemModel.itemsId.toString()] = "0";
                  controllerfav.removeFromFavorite(
                      controller.itemModel.itemsId.toString());
                } else {
                  controllerfav.favorite[controller.itemModel.itemsId.toString()] = "1";
                  controllerfav
                      .addToFavorite(controller.itemModel.itemsId.toString());
                }
              },
              icon: Icon(
                controllerfav.favorite[controller.itemModel.itemsId.toString()] == "1"
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
