import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchNavBar extends StatelessWidget {
  const CustomSearchNavBar(
      {super.key,
      required this.onPressedSearch,
      required this.onChanged,
      this.mycontroller});
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController? mycontroller;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: Container(
            color: Colors.transparent,
            child: TextField(
              controller: mycontroller,
              onChanged: onChanged,
              decoration: InputDecoration(
                fillColor: AppColors.grayOpen,
                hintText: 'Find your favorite Product',
                prefixIcon: IconButton(
                    onPressed: onPressedSearch,
                    icon: Icon(Icons.search, color: Colors.black)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ),
        Card(
          elevation: 0,
          color: AppColors.grayOpen,
          child: IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Get.toNamed(AppRoutes.myFavorite);
            },
          ),
        ),
      ],
    );
  }
}
