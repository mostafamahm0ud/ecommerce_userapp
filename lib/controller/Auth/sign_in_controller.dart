import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/core/services/services.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/Auth/sign_in_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignInController extends GetxController {
  signIn();
  goToSignUp();
  goToForgetPassword();
  isShowPassword();
}

class SignInControllerImp extends SignInController {
  ApiStatusRequest apiStatusRequest = ApiStatusRequest.none;
  SignInData signInData = SignInData(Get.find());
  MyServices myServices = Get.find();
  bool isPassword = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  @override
  isShowPassword() {
    isPassword = !isPassword;
    update();
  }

  @override
  signIn() async {
    if (formKey.currentState!.validate()) {
      apiStatusRequest = ApiStatusRequest.loading;
      update();
      var response = await signInData.postData(
        email.text,
        password.text,
      );
      apiStatusRequest = handlingRemoteData(response);
      if (apiStatusRequest == ApiStatusRequest.success) {
        if (response['status'] == 'success') {
          if (response['data']['users_approve'] == 1) {
            myServices.sharedPreferences
                .setString("id", response['data']['users_id'].toString());
            myServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            myServices.sharedPreferences
                .setString("userName", response['data']['users_name']);
            myServices.sharedPreferences
                .setString("phone", response['data']['users_phone']);
            myServices.sharedPreferences.setString("step", "2");
            Get.offNamed(AppRoutes.home);
          } else {
            Get.toNamed(AppRoutes.checkSignUpEmail,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "warning", middleText: "email or password is not correct");
          apiStatusRequest = ApiStatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  goToSignUp() {
    Get.toNamed(AppRoutes.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }
}
