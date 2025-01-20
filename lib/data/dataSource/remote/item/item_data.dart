import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/core/class/api_crud_operations.dart';

class ItemData {
  ApiCrudOperationsModel apiCrudOperationsModel;

  ItemData(this.apiCrudOperationsModel);
  postData(String categoryid, String userid) async {
    var response = await apiCrudOperationsModel.postData(
        ApiLinks.getItemsEndpoint,
        {"categoryid": categoryid, "userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
