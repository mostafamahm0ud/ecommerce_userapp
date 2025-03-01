// import 'package:ecommerce_userapp/core/class/api_status_request.dart';
// import 'package:ecommerce_userapp/core/constant/app_routes.dart';
// import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
// import 'package:ecommerce_userapp/data/dataSource/remote/Home/home_data.dart';
// import 'package:ecommerce_userapp/data/model/items_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// abstract class SearchController extends GetxController {
//   checkSearch(value);
//   onSearchItem();
//   searchData();
// }

// class SearchControllerImp extends SearchController {
//   ApiStatusRequest apiStatusRequest = ApiStatusRequest.none;
//   HomeData homeData = HomeData(Get.find());
//   TextEditingController? searchControllertext;
//   bool isSearch = false;
//   List<ItemModel> searchItems = [];

//   @override
//   checkSearch(value) {
//     if (value.isEmpty) {
//       apiStatusRequest = ApiStatusRequest.none;
//       isSearch = false;
//     }
//     update();
//   }

//   @override
//   onSearchItem() {
//     isSearch = true;
//     searchData();
//     update();
//   }

//   @override
//   searchData() async {
//     apiStatusRequest = ApiStatusRequest.loading;
//     update();
//     var response = await homeData.search(searchControllertext!.text , myservices.sharedPreferences.getString("id"));
//     print("=================== Controller $response ");
//     apiStatusRequest = handlingRemoteData(response);
//     if (apiStatusRequest == ApiStatusRequest.success) {
//       if (response['status'] == "success") {
//         searchItems.clear();
//         List responseItems = response['data'];
//         searchItems.addAll(responseItems.map((e) => ItemModel.fromJson(e)));
//       } else {
//         Get.defaultDialog(
//             title: "warning", middleText: "there is an error in the server");
//         apiStatusRequest = ApiStatusRequest.failure;
//       }
//     }
//     update();
//   }

//   goToItemDetails(itemModel) {
//     Get.toNamed(AppRoutes.itemsDetails, arguments: {"itemModel": itemModel});
//   }

//   @override
//   void onInit() {
//     searchControllertext = TextEditingController();
//     super.onInit();
//   }
// }
