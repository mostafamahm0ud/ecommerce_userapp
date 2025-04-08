import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/views/widget/cart/cart_chek_out_button.dart';
import 'package:ecommerce_userapp/views/widget/cart/coupon_boutton.dart';
import 'package:ecommerce_userapp/views/widget/cart/custom_price_count_cart.dart';
import 'package:flutter/material.dart';

class BottomNavigationCartBar extends StatelessWidget {
  const BottomNavigationCartBar({
    super.key,
    required this.price,
    required this.totalPrice,
    required this.discount,
    required this.couponController,
  });

  final String price;
  final String totalPrice;
  final String discount;
  final TextEditingController couponController;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(spacing: 5, children: [
          Expanded(
              flex: 2,
              child: TextFormField(
                controller: couponController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Coupon Code',
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                ),
              )),
          Expanded(
              child: CouponBoutton(
            onPressed: () {},
          ))
        ]),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadiusDirectional.all(Radius.circular(8)),
            border: Border.all(color: AppColors.primaryColor),
            color: AppColors.primaryColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              CustomPriceCountCart(
                title: 'Price',
                price: price,
              ),
              CustomPriceCountCart(
                title: 'discount',
                price: discount,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 1,
                ),
              ),
              CustomPriceCountCart(
                title: 'total Price',
                price: totalPrice,
                isTotal: true,
              ),
              const SizedBox(
                height: 5,
              ),
              CartChekOutButton(
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
