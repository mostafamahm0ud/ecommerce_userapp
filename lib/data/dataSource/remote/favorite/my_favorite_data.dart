import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/core/class/api_crud_operations.dart';

class MyFavoriteData {
  ApiCrudOperationsModel apiCrudOperationsModel;

  MyFavoriteData(this.apiCrudOperationsModel);

  getFavoriteData(String userid) async {
    var response =
        await apiCrudOperationsModel.postData(ApiLinks.favoriteEndpoint, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
