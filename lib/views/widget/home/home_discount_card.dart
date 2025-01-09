import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:flutter/material.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    super.key, required this.title, required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            height: 150,
            child: ListTile(
              title: Text(
                title,
                style: AppTextStyles.bodyContent16White,
              ),
              subtitle: Text(
                subtitle,
                style: AppTextStyles.headingText24Black,
              ),
            ),
          ),
          Positioned(
            right: -20,
            top: -12,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                color: const Color.fromARGB(193, 25, 52, 172),
              ),
            ),
          ),
          Positioned(
            right: -20,
            top: -7.5,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: const Color.fromARGB(253, 25, 52, 172),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
