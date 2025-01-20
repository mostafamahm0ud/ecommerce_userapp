import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/core/class/api_crud_operations.dart';

class FavoriteData {
  ApiCrudOperationsModel apiCrudOperationsModel;

  FavoriteData(this.apiCrudOperationsModel);

  
  getFavoriteData(String userid) async {
    var response =
        await apiCrudOperationsModel.postData(ApiLinks.favoriteEndpoint, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
  
  addToFavoriteData(String userid, String itemid) async {
    var response =
        await apiCrudOperationsModel.postData(ApiLinks.addfavoriteEndpoint, {
      "userid": userid,
      "itemid": itemid,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFromFavorite(String userid, String itemid) async {
    var response = await apiCrudOperationsModel
        .postData(ApiLinks.redmovefavoriteEndpoint, {
      "userid": userid,
      "itemid": itemid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
