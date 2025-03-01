import 'package:ecommerce_userapp/controller/home/home_controller.dart';
import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/favorite/my_favorite_data.dart';
import 'package:ecommerce_userapp/data/model/my_favorite_model.dart';
import 'package:get/get.dart';

abstract class MyFavoriteController extends GetxController {
  getMyFavoriteData();
  deleteFavoriteData(String id);
}

class MyFavoriteControllerImp extends SearchControllerImp
    implements MyFavoriteController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());
  List<MyFavoriteModel> myFavoriteList = [];

  @override
  getMyFavoriteData() async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await favoriteData
        .getFavoriteData(myServices.sharedPreferences.getString("id")!);
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
  deleteFavoriteData(id) {
    favoriteData.deleteFavoriteData(id);
    myFavoriteList
        .removeWhere((element) => element.favoriteId.toString() == id);
    print('myFavoriteList : $myFavoriteList');
    update();
  }

  @override
  void onInit() {
    getMyFavoriteData();
    super.onInit();
  }
}
