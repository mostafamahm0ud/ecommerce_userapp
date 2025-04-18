import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/core/middleware/my_middleware.dart';
import 'package:ecommerce_userapp/views/screen/Auth/verify_code_email_screen.dart';
import 'package:ecommerce_userapp/views/screen/Auth/forget_password/forget_password_screen.dart';
import 'package:ecommerce_userapp/views/screen/Auth/forget_password/reset_password_screen.dart';
import 'package:ecommerce_userapp/views/screen/Auth/sign_in_screen.dart';
import 'package:ecommerce_userapp/views/screen/Auth/sign_up_screen.dart';
import 'package:ecommerce_userapp/views/screen/Auth/forget_password/success_reset_password_screen.dart';
import 'package:ecommerce_userapp/views/screen/Auth/success_sign_up_screen.dart';
import 'package:ecommerce_userapp/views/screen/Auth/forget_password/verify_code_screen.dart';
import 'package:ecommerce_userapp/views/screen/address/add_address_details_screen.dart';
import 'package:ecommerce_userapp/views/screen/address/add_address_screen.dart';
import 'package:ecommerce_userapp/views/screen/address/address_screen.dart';
import 'package:ecommerce_userapp/views/screen/address/edit_address_screen.dart';
import 'package:ecommerce_userapp/views/screen/cart_screen.dart';
import 'package:ecommerce_userapp/views/screen/category_screen.dart';
import 'package:ecommerce_userapp/views/screen/home/home_screen.dart';
import 'package:ecommerce_userapp/views/screen/item_details_screen.dart';
import 'package:ecommerce_userapp/views/screen/my_favorite_screen.dart';
import 'package:ecommerce_userapp/views/screen/onboarding_screen.dart';
import 'package:ecommerce_userapp/views/screen/items_screen.dart';
import 'package:ecommerce_userapp/views/screen/select_language_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? route = [
  GetPage(
    name: AppRoutes.selectLanguage,
    page: () => const SelectLanguageScreen(),
    middlewares: [MyMiddleware()],
  ),
  GetPage(
    name: AppRoutes.onBoarding,
    page: () => const OnBoardingScreen(),
  ),
  GetPage(
    name: AppRoutes.signIn,
    page: () => const SignInScreen(),
  ),
  GetPage(
    name: AppRoutes.signUp,
    page: () => const SignUpScreen(),
  ),
  GetPage(
    name: AppRoutes.checkSignUpEmail,
    page: () => const VerfiyCodeSignUpEmailScreen(),
  ),
  GetPage(
    name: AppRoutes.successSignUpScreen,
    page: () => const SuccessSignUpScreen(),
  ),
  GetPage(
    name: AppRoutes.forgetPassword,
    page: () => const ForgetPasswordScreen(),
  ),
  GetPage(
    name: AppRoutes.verifyCode,
    page: () => const VerifyCodeScreen(),
  ),
  GetPage(
    name: AppRoutes.resetPassword,
    page: () => const ResetPasswordScreen(),
  ),
  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => const SuccessResetPasswordSuccess(),
  ),
  GetPage(
    name: AppRoutes.home,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AppRoutes.categories,
    page: () => const CategoryScreen(),
  ),
  GetPage(
    name: AppRoutes.items,
    page: () => const ItemsScreen(),
  ),
  GetPage(
    name: AppRoutes.itemsDetails,
    page: () => const ItemDetailsScreen(),
  ),
  GetPage(
    name: AppRoutes.myFavorite,
    page: () => const MyFavoriteScreen(),
  ),
  GetPage(
    name: AppRoutes.cart,
    page: () => const CartScreen(),
  ),
  GetPage(
    name: AppRoutes.address,
    page: () => const AddressScreen(),
  ),
  GetPage(
    name: AppRoutes.addressAdd,
    page: () => const AddressAddScreen(),
  ),
  GetPage(
    name: AppRoutes.addressAddDetails,
    page: () => const AddAddressDetailsScreen(),
  ),
  GetPage(
    name: AppRoutes.addressEdit,
    page: () => const AddressEditScreen(),
  ),
  // GetPage(
  //   name: AppRoutes.test,
  //   page: () => const TestScreen(),
  // ),
];

// Map<String, Widget Function(BuildContext)> routes = {
//   // select language route
//   AppRoutes.selectLanguage: (context) => const SelectLanguageScreen(),
//   // on boarding route
//   AppRoutes.onBoarding: (context) => const OnBoardingScreen(),
//   // auth routes
//   AppRoutes.signIn: (context) => const SignInScreen(),
//   AppRoutes.signUp: (context) => const SignUpScreen(),
//   AppRoutes.checkEmail: (context) => const CheckEmailScreen(),
//   AppRoutes.successSignUpScreen: (context) => const SuccessSignUpScreen(),
//   AppRoutes.forgetPassword: (context) => const ForgetPasswordScreen(),
//   AppRoutes.verifyCode: (context) => const VerifyCodeScreen(),
//   AppRoutes.resetPassword: (context) => const ResetPasswordScreen(),
//   AppRoutes.successResetPassword: (context) =>
//       const SuccessResetPasswordSuccess(),
// };
