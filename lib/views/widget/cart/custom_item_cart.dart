import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:flutter/material.dart';

class CustomItemCart extends StatelessWidget {
  const CustomItemCart({
    required this.onadd,
    required this.onremove,
    required this.itemscount,
    required this.itemsId,
    required this.itemsName,
    required this.itemsPrice,
    required this.itemsImage,
    super.key,
  });

  final String itemsName;
  final String itemsPrice;
  final int itemscount;
  final String itemsImage;
  final String itemsId;
  final void Function()? onadd;
  final void Function()? onremove;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.grayOpen,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                imageUrl: "${ApiLinks.imageItemsEndpoint}/$itemsImage",
                fit: BoxFit.scaleDown,
                height: 70
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListTile(
              title: Text(
                itemsName,
                style: AppTextStyles.bodyContent16Black,
              ),
              subtitle: Text(
                '$itemsPrice\$',
                style: AppTextStyles.bodyContent16Primary,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                  child: IconButton(
                    alignment: Alignment.topCenter,
                    icon: Icon(
                      Icons.add,
                    ),
                    onPressed: onadd,
                  ),
                ),
                SizedBox(
                    child: Text("$itemscount",
                        style: AppTextStyles.bodyContent20Black)),
                SizedBox(
                  height: 30,
                  child: IconButton(
                    icon: Icon(
                      Icons.remove,
                    ),
                    onPressed: onremove,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
