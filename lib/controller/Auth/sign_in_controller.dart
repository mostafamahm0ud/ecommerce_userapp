import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/core/services/services.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/Auth/sign_in_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignInController extends GetxController {
  void signIn();
  void goToSignUp();
  void goToForgetPassword();
  void togglePasswordVisibility();
}

class SignInControllerImp extends SignInController {
  ApiStatusRequest apiStatusRequest = ApiStatusRequest.none;
  final SignInData signInData = SignInData(Get.find());
  final MyServices myServices = Get.find();
  bool isPasswordVisible = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  @override
  Future<void> signIn() async {
    if (!formKey.currentState!.validate()) return;

    apiStatusRequest = ApiStatusRequest.loading;
    update();

    try {
      final response = await signInData.postData(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      apiStatusRequest = handlingRemoteData(response);

      if (apiStatusRequest == ApiStatusRequest.success) {
        if (response['status'] == 'success') {
          final userData = response['data'];
          if (userData['users_approve'] == 1) {
            _saveUserData(userData);
            Get.offNamed(AppRoutes.home);
          } else {
            Get.toNamed(
              AppRoutes.checkSignUpEmail,
              arguments: {"email": emailController.text.trim()},
            );
          }
        } else {
          _showErrorDialog("Email or password is incorrect.");
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

  void _saveUserData(Map<String, dynamic> userData) {
    myServices.sharedPreferences
        .setString("id", userData['users_id'].toString());
    myServices.sharedPreferences.setString("email", userData['users_email']);
    myServices.sharedPreferences.setString("userName", userData['users_name']);
    myServices.sharedPreferences.setString("phone", userData['users_phone']);
    myServices.sharedPreferences.setString("step", "2");
  }

  void _showErrorDialog(String message) {
    Get.defaultDialog(
      title: "Warning",
      middleText: message,
    );
  }

  @override
  void goToSignUp() {
    Get.toNamed(AppRoutes.signUp);
  }

  @override
  void goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}