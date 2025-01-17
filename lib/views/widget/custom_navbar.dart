import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomSearchNavBar extends StatelessWidget {
  const CustomSearchNavBar({
    super.key,required this.onPressedSearch, this.onPressedNotification,
  });
  final void Function()? onPressedSearch;
  final void Function()? onPressedNotification;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
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
            margin: EdgeInsets.only(left: 10),
            child: IconButton(
              icon: Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
                size: 34,
              ),
              onPressed: onPressedNotification,
            ),
          ),
        ],
      ),
    );
  }
}
