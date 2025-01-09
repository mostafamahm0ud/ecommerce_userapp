import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/core/class/api_crud_operations.dart';

class SignInData {
  ApiCrudOperationsModel apiCrudOperationsModel;

  SignInData(this.apiCrudOperationsModel);
  postData(String email, String password) async {
    var response =
        await apiCrudOperationsModel.postData(ApiLinks.signInEndpoint, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
