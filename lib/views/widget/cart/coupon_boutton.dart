import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CouponBoutton extends StatelessWidget {
  const CouponBoutton({super.key, required this.onPressed});
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColors.secondaryBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        alignment: Alignment.center,
        height: 40,
        child: const Text(
          'Apply',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
