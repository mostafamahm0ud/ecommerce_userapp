import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/core/services/services.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/cart/cart_data.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/cart/my_cart_data.dart';
import 'package:ecommerce_userapp/data/model/my_cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MyCartController extends GetxController {
  getData();
  resetVar();
  refreshData();
  checkCoupon();
  add(String itemid);
  remove(String itemid);
}

class MyCartControllerImp extends MyCartController {
  MyServices myServices = Get.find();
  ApiStatusRequest apiStatusRequest = ApiStatusRequest.none;
  MyCartData myCartData = MyCartData(Get.find());
  CartData cartData = CartData(Get.find());

  TextEditingController? couponController;

  List<MyCartModel> myCartList = [];
  var totalPrice = 0.0;
  var totalCount = 0;

  @override
  getData() async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await myCartData
        .getMyCartData(myServices.sharedPreferences.getString("id")!);
    apiStatusRequest = handlingRemoteData(response);
    if (apiStatusRequest == ApiStatusRequest.success) {
      if (response['status'] == "success") {
        if (response['data']['status'] == "success") {
          myCartList.clear();
          List listData = response['data']['data'];
          Map countPrice = response['countprice'];
          myCartList.addAll(listData.map((e) => MyCartModel.fromJson(e)));
          totalPrice = countPrice['totalprice'].toDouble();
          totalCount = countPrice['totalcount'];
        } else {
          Get.defaultDialog(
              title: "warning", middleText: "there is an error in the server");
          apiStatusRequest = ApiStatusRequest.failure;
          update();
        }
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "there is an error in the server");
      }
    }
    update();
  }

  @override
  add(itemid) async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await cartData.addToCartData(
        myServices.sharedPreferences.getString("id")!, itemid);
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
  remove(itemid) async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await cartData.removeFromCartData(
        myServices.sharedPreferences.getString("id")!, itemid);
    apiStatusRequest = handlingRemoteData(response);
    if (apiStatusRequest == ApiStatusRequest.success) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "success",
            message: "item removed from cart successfully",
            icon: const Icon(Icons.done, color: AppColors.primaryColor));
      } else {
        Get.rawSnackbar(
            title: "warning",
            message: "there is an error in the server",
            icon: const Icon(Icons.error, color: AppColors.primaryColor));
        apiStatusRequest = ApiStatusRequest.failure;
      }
    }
  }

  @override
  void onInit() {
    getData();
    couponController = TextEditingController();
    super.onInit();
  }

  @override
  resetVar() {
    totalPrice = 0.0;
    totalCount = 0;
    myCartList.clear();
  }

  @override
  refreshData() {
    resetVar();
    getData();
  }

  @override
  checkCoupon() async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await cartData.couponData(couponController!.text);
    apiStatusRequest = handlingRemoteData(response);
    if (apiStatusRequest == ApiStatusRequest.success) {
      if (response['status'] == "success") {
        
      } else {
        Get.rawSnackbar(
            title: "warning",
            message: "this coupon expired or not found",
            icon: const Icon(Icons.error, color: AppColors.primaryColor));
      }
    }
  }
}
