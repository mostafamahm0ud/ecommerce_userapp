import 'package:ecommerce_userapp/controller/cart/my_cart_controller.dart';
import 'package:ecommerce_userapp/core/class/api_manage_statuts_view.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/views/widget/cart/bottom_nav_bar_cart.dart';
import 'package:ecommerce_userapp/views/widget/cart/custom_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyCartControllerImp controller = Get.find<MyCartControllerImp>();
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
        body: ApiManageStatutsRequest(
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
        bottomNavigationBar: BottomNavigationCartBar(
          price: controller.totalPrice.toString(),
          totalPrice: controller.totalPrice.toString(),
          discount: '0',
          couponController: controller.couponController!,
        ));
  }
}
