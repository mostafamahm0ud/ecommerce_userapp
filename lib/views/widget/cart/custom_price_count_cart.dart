import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:flutter/material.dart';

class CustomPriceCountCart extends StatelessWidget {
  const CustomPriceCountCart({
    super.key,
    required this.title,
    required this.price,
    this.isTotal = false,
  });
  final String title;
  final String price;
  final bool isTotal;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: isTotal
              ? AppTextStyles.bodyContent20Black.copyWith(
                  color: Colors.redAccent,
                )
              : AppTextStyles.bodyContent16Black,
        ),
        Text(
          '$price\$',
          style: isTotal
              ? AppTextStyles.bodyContent20Black.copyWith(
                  color: Colors.redAccent,
                )
              : AppTextStyles.bodyContent16Black,
        ),
      ],
    );
  }
}
