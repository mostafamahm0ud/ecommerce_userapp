import 'package:ecommerce_userapp/controller/cart/my_cart_controller.dart';
import 'package:ecommerce_userapp/core/class/api_manage_statuts_view.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/views/widget/cart/cart_chek_out_button.dart';
import 'package:ecommerce_userapp/views/widget/cart/custom_item_cart.dart';
import 'package:ecommerce_userapp/views/widget/cart/custom_price_count_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends GetView<MyCartControllerImp> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: AppTextStyles.bodyContent20Gray,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: GetBuilder<MyCartControllerImp>(
        builder: (controller) => ApiManageStatutsRequest(
          statusRequest: controller.apiStatusRequest,
          widget: SingleChildScrollView(
            child: Column(children: [
              ...List.generate(
                controller.myCartList.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomItemCart(
                    itemsName: '${controller.myCartList[index].itemsName}',
                    itemsPrice: '${controller.myCartList[index].itemsprice}',
                    itemscount: controller.myCartList[index].countitems!,
                    itemsImage: '${controller.myCartList[index].itemsImage}',
                    itemsId: '${controller.myCartList[index].itemsId}',
                    onadd: () async {
                      await controller
                          .add("${controller.myCartList[index].itemsId!}");
                      controller.refreshData();
                    },
                    onremove: () async {
                      await controller
                          .remove("${controller.myCartList[index].itemsId!}");
                      controller.refreshData();
                    },
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: GetBuilder<MyCartControllerImp>(builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomPriceCountCart(
                title: 'Price',
                price: controller.totalPrice.toString(),
              ),
              CustomPriceCountCart(
                title: 'shipping',
                price: '30',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 1,
                ),
              ),
              CustomPriceCountCart(
                title: 'total Price',
                price: '${controller.totalPrice + 30}',
                isTotal: true,
              ),
              SizedBox(
                height: 5,
              ),
              CartChekOutButton(
                onPressed: () {},
              ),
            ],
          ),
        );
      }),
    );
  }
}
