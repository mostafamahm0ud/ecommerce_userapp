class ApiLinks {
  // static const String baseUrl = 'http://localhost/ecommerce';
  static const String baseUrl = 'http://10.0.2.2/ecommerce';
  static const String baseUrlconnect = '$baseUrl/conect.php';
//   static const String baseUrl = 'https://apitest.torra.online';
  static const String imageBaseUrl = '$baseUrl/upload';
  //============== image Endpoints=================
  static const String imageCategoriesEndpoint = '$imageBaseUrl/categories';
  static const String imageItemsEndpoint = '$imageBaseUrl/items';
  //============== Auth Endpoints=================
  static const String signUpEndpoint = '$baseUrl/auth/signup.php';
  static const String signInEndpoint = '$baseUrl/auth/signin.php';
  static const String veryfiycodeEndpoint = '$baseUrl/auth/veryfiycode.php';
  static const String reSendEmail = '$baseUrl/auth/resend.php';

  // ============== Forget Password Endpoints================= //
  static const String checkEmailEndpoint =
      '$baseUrl/forgetPassword/check_email.php';
  static const String veryfiyForgetPasswordCodeEndpoint =
      '$baseUrl/forgetPassword/veryfiy_code_forgoten_password.php';
  static const String resetPasswordEndpoint =
      '$baseUrl/forgetPassword/reset_password.php';

  // ============== Home Endpoints================= //
  static const String homeEndpoint = '$baseUrl/home.php';

  // ============== Categories Endpoints================= //
  static const String getCategoriesEndpoint = '$baseUrl/categories/view.php';

  // ============== Items Endpoints================= //
  static const String getItemsEndpoint = '$baseUrl/items/items.php';
  static const String searchItemsEndpoint = '$baseUrl/items/search.php';

  // ============= Favorite Endpoints================= //
  static const String favoriteEndpoint = '$baseUrl/favorite/view.php';
  static const String deleteitemfromfavoriteEndpoint =
      '$baseUrl/favorite/delete_item.php';
  static const String addfavoriteEndpoint = '$baseUrl/favorite/add.php';
  static const String redmovefavoriteEndpoint = '$baseUrl/favorite/remove.php';
  // ============= Cart Endpoints================= //
  static const String myCartEndpoint = '$baseUrl/cart/view.php';
  static const String addItemCartEndpoint = '$baseUrl/cart/add.php';
  static const String removeItemCartEndpoint = '$baseUrl/cart/delete.php';
  static const String countItemCartEndpoint = '$baseUrl/cart/count.php';

  // ============= Address Endpoints================= //
  static const String addAddressEndpoint = '$baseUrl/address/add.php';
  static const String viewAddressEndpoint = '$baseUrl/address/view.php';
  static const String deleteAddressEndpoint = '$baseUrl/address/delete.php';
  static const String editAddressEndpoint = '$baseUrl/address/edit.php';

  // ============= Coupon Endpoints================= //
  static const String checkCouponEndpoint = '$baseUrl/coupon/checkcoupon.php';
}
