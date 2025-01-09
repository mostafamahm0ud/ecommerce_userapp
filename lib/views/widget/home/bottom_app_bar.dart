import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButtomAppBarPages extends StatelessWidget {
  const CustomButtomAppBarPages({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.isSelected,
  });
  final Function() onPressed;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: isSelected ? AppColors.primaryColor : AppColors.gray,
          size: 35,
        ));
  }
}
