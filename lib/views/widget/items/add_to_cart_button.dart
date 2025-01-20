import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.addToCart,
  });
  final void Function()? addToCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 50,
      child: MaterialButton(
        onPressed: addToCart,
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              "Add to cart",
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyContent16White,
            ),
            Icon(
              Icons.add_shopping_cart_outlined,
              color: Colors.white,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
