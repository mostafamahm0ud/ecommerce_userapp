import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/favorite/my_favorite_data.dart';
import 'package:ecommerce_userapp/data/model/my_favorite_model.dart';
import 'package:get/get.dart';

abstract class MyFavoriteController extends GetxController {
  getMyFavoriteData();
}

class MyFavoriteControllerImp extends MyFavoriteController {
  ApiStatusRequest apiStatusRequest = ApiStatusRequest.none;

  MyFavoriteData favoriteData = MyFavoriteData(Get.find());

  List<MyFavoriteModel> myFavoriteList = [];

  @override
  getMyFavoriteData() async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await favoriteData
        .getFavoriteData("4" //  myServices.sharedPreferences.getString("id")!
            );
    print("=================== Controller $response");
    apiStatusRequest = handlingRemoteData(response);
    if (apiStatusRequest == ApiStatusRequest.success) {
      if (response['status'] == "success") {
        List listData = response['data'];
        myFavoriteList.addAll(listData.map((e) => MyFavoriteModel.fromJson(e)));
        print('data : $myFavoriteList');
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "there is an error in the server");
        apiStatusRequest = ApiStatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getMyFavoriteData();
    super.onInit();
  }
}
