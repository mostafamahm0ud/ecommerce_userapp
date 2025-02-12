import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/Home/home_data.dart';
import 'package:get/get.dart';

abstract class TestController extends GetxController {
  getData();
  @override
  onInit();
}

class TestControllerImp extends TestController {
  ApiStatusRequest apiStatusRequest = ApiStatusRequest.none;
  List categories = [];
  HomeData homeData = HomeData(Get.find());

  @override
  getData() async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await homeData.getData();
    print("=============================== Controller $response ");
    apiStatusRequest = handlingRemoteData(response);
    if (apiStatusRequest == ApiStatusRequest.success) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        print(categories);
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
    getData();
    super.onInit();
  }
}
