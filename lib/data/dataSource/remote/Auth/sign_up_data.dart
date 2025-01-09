import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/core/class/api_crud_operations.dart';

class SignUpData {
  ApiCrudOperationsModel apiCrudOperationsModel;
  SignUpData(this.apiCrudOperationsModel);
  postData(String username, String email, String password, String phone) async {
    var response =
        await apiCrudOperationsModel.postData(ApiLinks.signUpEndpoint, {
          "username": username,
          "email": email,
          "password": password,
          "phone": phone,
        });
    return response.fold((l) => l, (r) => r);
  }
}
