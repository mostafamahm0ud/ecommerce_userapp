import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/core/services/services.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/Home/home_data.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  goToCategoriesScreen();
  goToMyFavoriteScreen();
  goToProductsScreen(List categories, int slectedCategoryIndex,String categoryId);
}

class HomeControllerImp extends HomeController {
  late String language;
  MyServices myServices = Get.find();
  ApiStatusRequest apiStatusRequest = ApiStatusRequest.none;
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];
  // String? userName;
  // String? userId;
  // String? userEmail;
  // String? userPhone;

  @override
  initialData() {
    // userId = myServices.sharedPreferences.getString("id");
    // userEmail = myServices.sharedPreferences.getString("email");
    // userPhone = myServices.sharedPreferences.getString("phone");
    // userName = myServices.sharedPreferences.getString("userName");
    language = myServices.sharedPreferences.getString("language")!;
  }

  @override
  void onInit() {
    super.onInit();
    getData();
    initialData();
    update();
  }

  @override
  getData() async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await homeData.postData();
    print("=================== Controller $response ");
    apiStatusRequest = handlingRemoteData(response);
    if (apiStatusRequest == ApiStatusRequest.success) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
        print("categories.length = ${categories.length}" "items.length = ${items.length}");
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "there is an error in the server");
        apiStatusRequest = ApiStatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToCategoriesScreen() {
    Get.toNamed(AppRoutes.categories, arguments: {"categories": categories});
  }
  @override
  goToMyFavoriteScreen() {
    Get.toNamed(AppRoutes.myFavorite);
  }

  @override
  goToProductsScreen(categories, slectedCategoryIndex,categoryId) {
    Get.toNamed(AppRoutes.items, arguments: {
      "categories": categories,
      "slectedCategoryIndex": slectedCategoryIndex ,
      "categoryId" :categoryId,
    });
  }
}
