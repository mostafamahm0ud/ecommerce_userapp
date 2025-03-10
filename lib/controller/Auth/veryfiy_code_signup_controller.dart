import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/Auth/signup_verfiycode_data.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  void goToSuccessSignUp(String verifyCode);
  void reSendEmail();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  final SignupVerfiycodeData signupVerifycodeData =
      SignupVerfiycodeData(Get.find());
  ApiStatusRequest apiStatusRequest = ApiStatusRequest.none;
  String? email;

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  Future<void> goToSuccessSignUp(String verifyCode) async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();

    try {
      final response = await signupVerifycodeData.postData(verifyCode, email!);
      apiStatusRequest = handlingRemoteData(response);

      if (apiStatusRequest == ApiStatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoutes.successSignUpScreen);
        } else {
          _showErrorDialog("Verification code is not correct.");
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

  @override
  Future<void> reSendEmail() async {
    try {
      await signupVerifycodeData.reSend(email!);
      Get.snackbar(
        "Success",
        "Verification email has been resent.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      _showErrorDialog("Failed to resend verification email.");
    }
  }

  void _showErrorDialog(String message) {
    Get.defaultDialog(
      title: "Warning",
      middleText: message,
    );
  }
}
