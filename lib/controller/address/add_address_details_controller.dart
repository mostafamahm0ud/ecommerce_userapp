import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/core/services/services.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/Adress/addrees_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressDetailsControllerImp extends GetxController {
  ApiStatusRequest apiStatusRequest = ApiStatusRequest.loading;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  String? lat;
  String? long;

  initialData() {
    lat = Get.arguments['lat'];
    long = Get.arguments['lng'];
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
  }

  addAddress() async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await addressData.addAddressData(
        name!.text,
        city!.text,
        myServices.sharedPreferences.getString("id")!,
        street!.text,
        lat!,
        long!);
    print("=================== Controller $response");
    apiStatusRequest = handlingRemoteData(response);
    if (apiStatusRequest == ApiStatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.home);
        Get.defaultDialog(
            title: "success", middleText: "Address added successfully");
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "there is an error in the server");
        apiStatusRequest = ApiStatusRequest.failure;
      }
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
