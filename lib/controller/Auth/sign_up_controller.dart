import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/Auth/sign_up_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  void signUp();
  void goToSignIn();
  void togglePasswordVisibility();
}

class SignUpControllerImp extends SignUpController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SignUpData signUpData = SignUpData(Get.find());
  bool isPasswordVisible = true;
  late final TextEditingController userNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController passwordController;
  ApiStatusRequest apiStatusRequest = ApiStatusRequest.none;

  @override
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  @override
  Future<void> signUp() async {
    if (!formKey.currentState!.validate()) return;

    apiStatusRequest = ApiStatusRequest.loading;
    update();

    try {
      final response = await signUpData.postData(
        userNameController.text.trim(),
        emailController.text.trim(),
        passwordController.text.trim(),
        phoneNumberController.text.trim(),
      );

      apiStatusRequest = handlingRemoteData(response);

      if (apiStatusRequest == ApiStatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offNamed(
            AppRoutes.checkSignUpEmail,
            arguments: {'email': emailController.text.trim()},
          );
        } else {
          _showErrorDialog("Phone number or email already exists.");
          apiStatusRequest = ApiStatusRequest.failure;
        }
      }
    } catch (e) {
      _showErrorDialog("An error occurred. Please try again.");
      apiStatusRequest = ApiStatusRequest.failure;
    } finally {
      update();
    }
  }

  void _showErrorDialog(String message) {
    Get.defaultDialog(
      title: "Warning",
      middleText: message,
    );
  }

  @override
  void goToSignIn() {
    Get.offNamed(AppRoutes.signIn);
  }

  @override
  void onInit() {
    userNameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    userNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}