import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/Auth/sign_up_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
  showPassword();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SignUpData signUpData = SignUpData(Get.find());
  bool isPassword = true;
  late TextEditingController userName;
  late TextEditingController email;
  late TextEditingController phoneNumber;
  late TextEditingController password;
  ApiStatusRequest apiStatusRequest=ApiStatusRequest.none;
  @override
  showPassword() {
    isPassword = !isPassword;
    update();
  }

  @override
  signUp() async {
    if (formKey.currentState!.validate()) {
      apiStatusRequest = ApiStatusRequest.loading;
      update();
      var response = await signUpData.postData(
        userName.text,
        email.text,
        password.text,
        phoneNumber.text,
      );
      apiStatusRequest = handlingRemoteData(response);
      if (apiStatusRequest == ApiStatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoutes.checkSignUpEmail, arguments: {'email': email.text});
        } else {
          Get.defaultDialog(
              title: "warning",
              middleText: "Phone Number Or Email Already Exist");
          apiStatusRequest = ApiStatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.signIn);
  }

  @override
  void onInit() {
    userName = TextEditingController();
    email = TextEditingController();
    phoneNumber = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
}
