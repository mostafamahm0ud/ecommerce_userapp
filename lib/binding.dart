import 'package:ecommerce_userapp/controller/Auth/success_sign_up_controller.dart';
import 'package:ecommerce_userapp/controller/Auth/veryfiy_code_signup_controller.dart';
import 'package:ecommerce_userapp/controller/address/add_address_controller.dart';
import 'package:ecommerce_userapp/controller/address/add_address_details_controller.dart';
import 'package:ecommerce_userapp/controller/address/view_address_controller.dart';
import 'package:ecommerce_userapp/controller/cart/cart_controller.dart';
import 'package:ecommerce_userapp/controller/cart/my_cart_controller.dart';
import 'package:ecommerce_userapp/controller/favorite/favorite_controller.dart';
import 'package:ecommerce_userapp/controller/forgetPassword/forget_password_controller.dart';
import 'package:ecommerce_userapp/controller/forgetPassword/reset_password_controller.dart';
import 'package:ecommerce_userapp/controller/Auth/sign_in_controller.dart';
import 'package:ecommerce_userapp/controller/Auth/sign_up_controller.dart';
import 'package:ecommerce_userapp/controller/forgetPassword/success_reset_password_controller.dart';
import 'package:ecommerce_userapp/controller/forgetPassword/verify_code_reset_controller.dart';
import 'package:ecommerce_userapp/controller/home/home_controller.dart';
import 'package:ecommerce_userapp/controller/home/home_screen_controller.dart';
import 'package:ecommerce_userapp/controller/item/itemDeteils_controller.dart';
import 'package:ecommerce_userapp/controller/item/item_controller.dart';
import 'package:ecommerce_userapp/controller/favorite/my_favorite_controller.dart';
import 'package:ecommerce_userapp/controller/setting_controller.dart';
import 'package:ecommerce_userapp/controller/test_controller.dart';
import 'package:ecommerce_userapp/core/class/api_crud_operations.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiCrudOperationsModel(), fenix: true);
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    Get.lazyPut(() => SignInControllerImp(), fenix: true);
    Get.lazyPut(() => ForgetPasswordControllerImp(), fenix: true);
    Get.lazyPut(() => ResetPasswordControllerImp(), fenix: true);
    Get.lazyPut(() => VerifyCodeControllerImp(), fenix: true);
    Get.lazyPut(() => VerifyCodeSignUpControllerImp(), fenix: true);
    Get.lazyPut(() => SuccessSignUpControllerImp(), fenix: true);
    Get.lazyPut(() => SuccessResetPasswordControllerImp(), fenix: true);
    Get.lazyPut(() => HomeControllerImp(), fenix: true);
    Get.lazyPut(() => HomeScreenControllerImp(), fenix: true);
    Get.lazyPut(() => ItemControllerImp(), fenix: true);
    Get.lazyPut(() => ItemDeteilsControllerImp(), fenix: true);
    Get.lazyPut(() => FavoriteControllerImp(), fenix: true);
    Get.lazyPut(() => MyFavoriteControllerImp(), fenix: true);
    Get.lazyPut(() => SettingControllerImp(), fenix: true);
    Get.lazyPut(() => CartControllerImp(), fenix: true);
    Get.lazyPut(() => MyCartControllerImp(), fenix: true);
    Get.lazyPut(() => AddAddressController(), fenix: true);
    Get.lazyPut(() => AddAddressDetailsControllerImp(), fenix: true);
    Get.lazyPut(() => ViewAddressController(), fenix: true);
    Get.lazyPut(() => TestControllerImp(), fenix: true);
  }
}
