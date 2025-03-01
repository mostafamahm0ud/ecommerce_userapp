import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/core/services/services.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/Home/home_data.dart';
import 'package:ecommerce_userapp/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  goToCategoriesScreen();
  goToProductsScreen(
      List categories, int slectedCategoryIndex, String categoryId);
}

class HomeControllerImp extends SearchControllerImp implements HomeController {
  late String language;
  List categories = [];
  List items = [];
  String? userName;
  String? userId;
  String? userEmail;
  String? userPhone;

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
}

class SearchControllerImp extends GetxController {
  ApiStatusRequest apiStatusRequest = ApiStatusRequest.none;
  HomeData homeData = HomeData(Get.find());
  TextEditingController? searchController;
  MyServices myServices = Get.find();
  bool isSearch = false;
  List<ItemModel> searchItems = [];

  searchData() async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await homeData.search(
        searchController!.text, myServices.sharedPreferences.getString("id")!);
    print("=================== Controller $response ");
    apiStatusRequest = handlingRemoteData(response);
    if (apiStatusRequest == ApiStatusRequest.success) {
      if (response['status'] == "success") {
        searchItems.clear();
        List responseItems = response['data'];
        searchItems.addAll(responseItems.map((e) => ItemModel.fromJson(e)));
        print(searchItems);
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
    searchController = TextEditingController();
    super.onInit();
  }

  checkSearch(value) {
    if (value.isEmpty) {
      apiStatusRequest = ApiStatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItem() {
    isSearch = true;
    searchData();
    update();
  }

  goToItemDetails(ItemModel itemModel) {
    Get.toNamed(AppRoutes.itemsDetails, arguments: {"itemModel": itemModel});
  }
}
