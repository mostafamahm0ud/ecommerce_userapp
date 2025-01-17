class ApiLinks {
  static const String baseUrl = 'http://localhost/ecommerce';
  static const String baseUrlconnect = '$baseUrl/conect.php';
  // static const String baseUrl = 'https://apitest.torra.online';
  static const String imageBaseUrl =
      '$baseUrl/upload';
  //============== image Endpoints=================
  static const String imageCategoriesEndpoint = '$imageBaseUrl/categories';
  static const String imageProductEndpoint = '$imageBaseUrl/items';
  //============== Auth Endpoints=================
  static const String signUpEndpoint = '$baseUrl/auth/signup.php';
  static const String signInEndpoint = '$baseUrl/auth/signin.php';
  static const String veryfiycodeEndpoint = '$baseUrl/auth/veryfiycode.php';

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
  static const String getItemsEndpoint = '$baseUrl/items/items.php';
}
