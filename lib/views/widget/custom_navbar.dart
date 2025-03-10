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
            height: 40,
            color: AppColors.grayOpen,
            child: TextField(
              controller: mycontroller,
              onChanged: onChanged,
              decoration: InputDecoration(
                fillColor: AppColors.gray,
                hintText: 'Find Product',
                prefixIcon: IconButton(
                    onPressed: onPressedSearch,
                    icon: const Icon(Icons.search, color: Colors.black)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        Card(
          elevation: 0,
          color: AppColors.grayOpen,
          child: IconButton(
            icon: const Icon(
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
