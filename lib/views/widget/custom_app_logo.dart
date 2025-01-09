import 'package:ecommerce_userapp/core/constant/image_assets.dart';
import 'package:flutter/material.dart';

class CustomAppLogo extends StatelessWidget {
  const CustomAppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.logo,
      height: 100,
    );
  }
}
