import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/core/class/api_crud_operations.dart';

class HomeData {
  ApiCrudOperationsModel apiCrudOperationsModel;

  HomeData(this.apiCrudOperationsModel);
  postData() async {
    var response =
        await apiCrudOperationsModel.postData(ApiLinks.homeEndpoint, {});
    return response.fold((l) => l, (r) => r);
  }
}
