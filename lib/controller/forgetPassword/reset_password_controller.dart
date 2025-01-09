import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/ForgetPassword/reset_password_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  isShowPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  ApiStatusRequest apiStatusRequest=ApiStatusRequest.none;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email;

  bool isPassword = true;

  late TextEditingController password;
  late TextEditingController confirmingpassword;

  @override
  resetPassword() async {
    if (password.text != confirmingpassword.text) {
      Get.defaultDialog(title: "warning", middleText: "Password Not Match");
    }
    if (formKey.currentState!.validate()) {
      apiStatusRequest = ApiStatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(
        email!,
        password.text,
      );
      apiStatusRequest = handlingRemoteData(response);
      if (apiStatusRequest == ApiStatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoutes.successResetPassword);
        } else {
          Get.defaultDialog(title: "warning", middleText: "Something went wrong");
          apiStatusRequest = ApiStatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    confirmingpassword = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  isShowPassword() {
    isPassword = !isPassword;
    update();
  }
}
