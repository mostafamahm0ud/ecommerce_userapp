import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:flutter/material.dart';

class PriceAndCount extends StatelessWidget {
  const PriceAndCount({
    super.key,
    required this.onAdd,
    required this.onRemove,
    required this.price,
    required this.count,
  });

  final void Function()? onAdd;
  final void Function()? onRemove;

  final String price;
  final String count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 5,
          children: [
            IconButton(
              onPressed: onRemove,
              icon: const Icon(
                Icons.remove,
              ),
            ),
            Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                count,
                textAlign: TextAlign.center,
                style: AppTextStyles.headingText24Black.copyWith(
                  height: 1.2,
                ),
              ),
            ),
            IconButton(
              onPressed: onAdd,
              icon: const Icon(
                Icons.add,
              ),
            )
          ],
        ),
        const Spacer(),
        Text(
          "$price\$",
          style: AppTextStyles.headingText24Black.copyWith(
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
