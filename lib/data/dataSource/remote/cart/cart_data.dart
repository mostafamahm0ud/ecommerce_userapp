import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/core/class/api_crud_operations.dart';

class CartData {
  ApiCrudOperationsModel apiCrudOperationsModel;

  CartData(this.apiCrudOperationsModel);

  addToCartData(String userid, String itemid) async {
    var response =
        await apiCrudOperationsModel.postData(ApiLinks.addItemCartEndpoint, {
      "userid": userid,
      "itemid": itemid,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFromCartData(String userid, String itemid) async {
    var response =
        await apiCrudOperationsModel.postData(ApiLinks.removeItemCartEndpoint, {
      "userid": userid,
      "itemid": itemid,
    });
    return response.fold((l) => l, (r) => r);
  }

  
  countItem(String userid, String itemid) async {
    var response =
        await apiCrudOperationsModel.postData(ApiLinks.countItemCartEndpoint, {
      "userid": userid,
      "itemid": itemid,
    });
    return response.fold((l) => l, (r) => r);
  }
  
  couponData(String coupon) async {
    var response =
        await apiCrudOperationsModel.postData(ApiLinks.checkCouponEndpoint, {
      "coupon_name": coupon,
    });
    return response.fold((l) => l, (r) => r);
  }
}
