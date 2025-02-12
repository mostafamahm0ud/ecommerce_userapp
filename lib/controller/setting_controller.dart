import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/core/services/services.dart';
import 'package:get/get.dart';

abstract class SettingController extends GetxController {
  logOut();
}

class SettingControllerImp extends SettingController {
  MyServices myServices = Get.find();
  @override
  logOut() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.signIn);
  }
}
