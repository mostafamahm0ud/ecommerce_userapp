import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  goToSignIn();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.signIn);
  }
}
