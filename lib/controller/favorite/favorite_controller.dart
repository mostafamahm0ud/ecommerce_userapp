import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/core/services/services.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/favorite/favorite_data.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  addToFavorite(String itemid);
  updateFavorite(id, value);
  removeFromFavorite(String itemid);
}

class FavoriteControllerImp extends FavoriteController {
  Map favorite = {};

  ApiStatusRequest apiStatusRequest = ApiStatusRequest.none;

  FavoriteData favoriteData = FavoriteData(Get.find());

  MyServices myServices = Get.find();

  @override
  updateFavorite(id, value) {
    favorite[id] = value;
    update();
  }

  @override
  addToFavorite(itemid) async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await favoriteData.addToFavoriteData(
        myServices.sharedPreferences.getString("id")!, itemid);
    print("=================== Controller $response add to favorite");
    apiStatusRequest = handlingRemoteData(response);
    if (apiStatusRequest == ApiStatusRequest.success) {
      if (response['status'] == "success") {
        Get.snackbar("success", "item added to favorite",
            backgroundColor: AppColors.gray,
            colorText: AppColors.black);
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "there is an error in the server");
        apiStatusRequest = ApiStatusRequest.failure;
      }
    }
  }

  @override
  removeFromFavorite(itemid) async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await favoriteData.removeFromFavorite(
        myServices.sharedPreferences.getString("id")!, itemid);
    print("=================== Controller $response remove from favorite");
    apiStatusRequest = handlingRemoteData(response);
    if (apiStatusRequest == ApiStatusRequest.success) {
      if (response['status'] == "success") {
        Get.snackbar("success", "item removed from favorite",
            backgroundColor: AppColors.gray,
            colorText: AppColors.black);
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "there is an error in the server");
        apiStatusRequest = ApiStatusRequest.failure;
      }
    }
  }
}
