import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/core/services/services.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/cart/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  addToCart(String itemid);
  removeFromCart(String itemid);
  countItemCart(String itemid);
}

class CartControllerImp extends CartController {
  ApiStatusRequest apiStatusRequest = ApiStatusRequest.none;

  CartData cartData = CartData(Get.find());

  MyServices myServices = Get.find();

  @override
  addToCart(itemid) async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await cartData.addToCartData(
        myServices.sharedPreferences.getString("id")!, itemid);
    print("=================== Controller $response add to favorite");
    apiStatusRequest = handlingRemoteData(response);
    if (apiStatusRequest == ApiStatusRequest.success) {
      if (response['status'] == "success") {
        Get.snackbar("success", "item added to cart successfully",
            backgroundColor: AppColors.gray, colorText: AppColors.black);
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "there is an error in the server");
        apiStatusRequest = ApiStatusRequest.failure;
      }
    }
  }

  @override
  removeFromCart(itemid) async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await cartData.removeFromCartData(
        myServices.sharedPreferences.getString("id")!, itemid);
    print("=================== Controller $response remove from cart");
    apiStatusRequest = handlingRemoteData(response);
    if (apiStatusRequest == ApiStatusRequest.success) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "success",
            message: "item removed from cart successfully",
            backgroundColor: AppColors.gray,
            icon: Icon(Icons.done, color: AppColors.primaryColor));
      } else {
        Get.rawSnackbar(
            title: "warning",
            message: "there is an error in the server",
            backgroundColor: AppColors.gray,
            icon: Icon(Icons.error,
                color: const Color.fromARGB(64, 255, 255, 255)));
        apiStatusRequest = ApiStatusRequest.failure;
      }
    }
  }

  @override
  countItemCart(itemid) async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await cartData.countItem(
        myServices.sharedPreferences.getString("id")!, itemid);
    apiStatusRequest = handlingRemoteData(response);
    if (apiStatusRequest == ApiStatusRequest.success) {
      if (response['status'] == "success") {
        var countItem = "0";
        countItem = response['data'].toString();
        return countItem;
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "there is an error in the server");
        apiStatusRequest = ApiStatusRequest.failure;
      }
    }
  }
}
