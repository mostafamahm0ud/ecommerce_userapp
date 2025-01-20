import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/favorite/favorite_data.dart';
import 'package:get/get.dart';

class FavoriteControllerImp extends GetxController {
  Map favorite = {};

  ApiStatusRequest apiStatusRequest = ApiStatusRequest.none;

  FavoriteData favoriteData = FavoriteData(Get.find());

  updateFavorite(id, value) {
    favorite[id] = value;
    update();
  }

  addToFavorite(String itemid) async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await favoriteData.addToFavoriteData(
        "4" //  myServices.sharedPreferences.getString("id")!
        ,
        itemid);
    print("=================== Controller $response add to favorite");
    apiStatusRequest = handlingRemoteData(response);
    if (apiStatusRequest == ApiStatusRequest.success) {
      if (response['status'] == "success") {
        Get.snackbar("success", "item added to favorite",
            backgroundColor: AppColors.primaryColor,
            colorText: AppColors.white);
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "there is an error in the server");
        apiStatusRequest = ApiStatusRequest.failure;
      }
    }
  }

  removeFromFavorite(String itemid) async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await favoriteData.removeFromFavorite(
        "4" //  myServices.sharedPreferences.getString("id")!
        ,
        itemid);
    print("=================== Controller $response remove from favorite");
    apiStatusRequest = handlingRemoteData(response);
    if (apiStatusRequest == ApiStatusRequest.success) {
      if (response['status'] == "success") {
        Get.snackbar("success", "item removed from favorite",
            backgroundColor: AppColors.primaryColor,
            colorText: AppColors.white);
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "there is an error in the server");
        apiStatusRequest = ApiStatusRequest.failure;
      }
    }
  }
}
