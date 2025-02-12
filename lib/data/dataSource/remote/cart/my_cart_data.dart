import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/core/class/api_crud_operations.dart';

class MyCartData {
  ApiCrudOperationsModel apiCrudOperationsModel;

  MyCartData(this.apiCrudOperationsModel);

  getMyCartData(String userid) async {
    var response =
        await apiCrudOperationsModel.postData(ApiLinks.myCartEndpoint, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

}
