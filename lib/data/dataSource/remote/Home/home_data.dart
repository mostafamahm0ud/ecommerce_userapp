import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/core/class/api_crud_operations.dart';

class HomeData {
  ApiCrudOperationsModel apiCrudOperationsModel;

  HomeData(this.apiCrudOperationsModel);
  getData() async {
    var response =
        await apiCrudOperationsModel.postData(ApiLinks.homeEndpoint, {});
    return response.fold((l) => l, (r) => r);
  }

  search(String search, String userid) async {
    var response = await apiCrudOperationsModel.postData(
        ApiLinks.searchItemsEndpoint, {"search": search, "userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
