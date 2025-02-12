import 'package:ecommerce_userapp/controller/search_controller.dart';
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
  goToProductsScreen(
      List categories, int slectedCategoryIndex, String categoryId);
}

class HomeControllerImp extends HomeController {
  SearchControllerImp searchController = Get.find<SearchControllerImp>();
  late String language;
  MyServices myServices = Get.find();
  ApiStatusRequest apiStatusRequest = ApiStatusRequest.none;
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];
  String? userName;
  String? userId;
  String? userEmail;
  String? userPhone;
  // TextEditingController? searchController;
  // bool isSearch = false;
  // List<ItemModel> searchItems = [];

  // checkSearch(value) {
  //   if (value.isEmpty) {
  //     isSearch = false;
  //   }
  //   update();
  // }

  // onSearchItem() {
  //   isSearch = true;
  //   searchData();
  //   update();
  // }

  @override
  initialData() {
    userId = myServices.sharedPreferences.getString("id");
    userEmail = myServices.sharedPreferences.getString("email");
    userPhone = myServices.sharedPreferences.getString("phone");
    userName = myServices.sharedPreferences.getString("userName");
    language = myServices.sharedPreferences.getString("language") ?? "en";
  }

  @override
  void onInit() {
    super.onInit();
    // searchController = TextEditingController();
    getData();
    initialData();
    update();
  }

  @override
  getData() async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await homeData.getData();
    print("=================== Controller $response ");
    apiStatusRequest = handlingRemoteData(response);
    if (apiStatusRequest == ApiStatusRequest.success) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        print("categories.length = ${categories.length}"
            "items.length = ${items.length}");
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "there is an error in the server");
        apiStatusRequest = ApiStatusRequest.failure;
      }
    }
    update();
  }

  // searchData() async {
  //   apiStatusRequest = ApiStatusRequest.loading;
  //   update();
  //   var response = await homeData.search(searchController!.text);
  //   print("=================== Controller $response ");
  //   apiStatusRequest = handlingRemoteData(response);
  //   if (apiStatusRequest == ApiStatusRequest.success) {
  //     if (response['status'] == "success") {
  //       searchItems.clear();
  //       List responseItems = response['data'];
  //       searchItems.addAll(responseItems.map((e) => ItemModel.fromJson(e)));
  //     } else {
  //       Get.defaultDialog(
  //           title: "warning", middleText: "there is an error in the server");
  //       apiStatusRequest = ApiStatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

  @override
  goToCategoriesScreen() {
    Get.toNamed(AppRoutes.categories, arguments: {"categories": categories});
  }

  @override
  goToProductsScreen(categories, slectedCategoryIndex, categoryId) {
    Get.toNamed(AppRoutes.items, arguments: {
      "categories": categories,
      "slectedCategoryIndex": slectedCategoryIndex,
      "categoryId": categoryId,
    });
  }

  // goToItemDetails(itemModel) {
  //   Get.toNamed(AppRoutes.itemsDetails, arguments: {"itemModel": itemModel});
  // }
}
