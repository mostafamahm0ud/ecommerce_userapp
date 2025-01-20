import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomSearchNavBar extends StatelessWidget {
  const CustomSearchNavBar({
    super.key,required this.onPressedSearch, required this.onPressedNotification,required this.onPressedFavorite,
  });
  final void Function()? onPressedSearch;
  final void Function()? onPressedNotification;
  final void Function()? onPressedFavorite;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Expanded(
          child: Container(
            color: Colors.transparent,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.grayOpen,
                hintText: 'Search',
                prefixIcon: IconButton(
                    onPressed: onPressedSearch,
                    icon: Icon(Icons.search, color: Colors.black)),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
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
              Icons.notifications_none,
              color: Colors.black,
              size: 34,
            ),
            onPressed: onPressedNotification,
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
            onPressed: onPressedFavorite,
          ),
        ),
      ],
    );
  }
}
