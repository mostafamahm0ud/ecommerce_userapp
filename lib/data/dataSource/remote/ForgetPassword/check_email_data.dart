import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/core/class/api_crud_operations.dart';

class CheckEmailData {
  ApiCrudOperationsModel apiCrudOperationsModel;

  CheckEmailData(this.apiCrudOperationsModel);
  postData(String email) async {
    var response =
        await apiCrudOperationsModel.postData(ApiLinks.checkEmailEndpoint, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
