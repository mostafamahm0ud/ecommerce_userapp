import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/ForgetPassword/check_email_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  ApiStatusRequest apiStatusRequest = ApiStatusRequest.none;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController email;
  @override
  checkEmail()async {
   if (formKey.currentState!.validate()) {
      apiStatusRequest = ApiStatusRequest.loading;
      update();
      var response = await checkEmailData.postData(
        email.text,
      );
      apiStatusRequest = handlingRemoteData(response);
      if (apiStatusRequest == ApiStatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoutes.verifyCode, arguments: {
            'email': email.text
          });
        } else {
          Get.defaultDialog(
              title: "warning",
              middleText: "Email Is Not Valid");
          apiStatusRequest = ApiStatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
