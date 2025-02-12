import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/Auth/signup_verfiycode_data.dart';
import 'package:get/get.dart';

abstract class VeryfiyCodeSignUpController extends GetxController {
  goToSuccessSignUp(String verifyCode);
  reSendEmail();
}

class VeryfiyCodeSignUpControllerImp extends VeryfiyCodeSignUpController {
  SignupVerfiycodeData signupVerfiycodeData = SignupVerfiycodeData(Get.find());
  ApiStatusRequest apiStatusRequest = ApiStatusRequest.none;
  String? email;

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void goToSuccessSignUp(String verifyCode) async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await signupVerfiycodeData.postData(verifyCode, email!);
    apiStatusRequest = handlingRemoteData(response);
    if (apiStatusRequest == ApiStatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoutes.successSignUpScreen);
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "Verify code is not correct");
        apiStatusRequest = ApiStatusRequest.failure;
      }
    }
    update();
  }

  @override
  reSendEmail() {
    signupVerfiycodeData.reSend(email!);
  }
}
