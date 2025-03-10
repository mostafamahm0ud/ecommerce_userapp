import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/core/services/services.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/Adress/addrees_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressDetailsControllerImp extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ApiStatusRequest apiStatusRequest = ApiStatusRequest.none;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  late TextEditingController name;
  late TextEditingController city;
  late TextEditingController street;

  String? lat;
  String? long;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    city.dispose();
    street.dispose();
    super.onClose();
  }

  void initialData() {
    // Retrieve latitude and longitude from arguments
    lat = Get.arguments['lat'];
    long = Get.arguments['lng'];

    // Initialize text controllers
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
  }

  Future<void> addAddress() async {
    // Validate required fields
    if (name.text.isEmpty || city.text.isEmpty || street.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Validate latitude and longitude
    if (lat == null || long == null) {
      Get.snackbar(
        "Error",
        "Invalid location data. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Update status to loading
    apiStatusRequest = ApiStatusRequest.loading;
    update();

    try {
      // Call the API to add address
      var response = await addressData.addAddressData(
        name.text,
        city.text,
        myServices.sharedPreferences.getString("id")!,
        street.text,
        lat!,
        long!,
      );

      print("=================== Controller $response");

      // Handle the API response
      apiStatusRequest = handlingRemoteData(response);
      if (apiStatusRequest == ApiStatusRequest.success) {
        if (response['status'] == "success") {
          // Navigate to home screen on success
          Get.offAllNamed(AppRoutes.home);
          Get.defaultDialog(
            title: "Success",
            middleText: "Address added successfully",
          );
        } else {
          // Show error dialog if the server returns an error
          Get.defaultDialog(
            title: "Warning",
            middleText: "There was an error on the server",
          );
          apiStatusRequest = ApiStatusRequest.failure;
        }
      } else {
        // Handle API failure
        Get.defaultDialog(
          title: "Error",
          middleText: "Failed to add address. Please try again.",
        );
        apiStatusRequest = ApiStatusRequest.failure;
      }
    } catch (e) {
      // Handle exceptions
      Get.defaultDialog(
        title: "Error",
        middleText: "An unexpected error occurred. Please try again.",
      );
      apiStatusRequest = ApiStatusRequest.failure;
    } finally {
      update();
    }
  }
}
