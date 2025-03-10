import 'package:ecommerce_userapp/controller/home/home_controller.dart';
import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/core/services/services.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/item/item_data.dart';
import 'package:ecommerce_userapp/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemController extends GetxController {
  initilData();
  changeSelectedCategory(int index, String catId);
  getData(String categoryId);
  goToItemDetails(ItemModel itemModel);
}

class ItemControllerImp extends SearchControllerImp implements ItemController {
  List categories = [];
  int? selectedCategoryIndex;
  String? catId;
  @override
  MyServices myServices = Get.find();
  List items = [];
  ItemData itemData = ItemData(Get.find());

  @override
  void onInit() {
    initilData();
    getData(catId!);
    super.onInit();
  }

  @override
  initilData() {
    categories = Get.arguments['categories'];
    selectedCategoryIndex = Get.arguments['slectedCategoryIndex'];
    catId = Get.arguments['categoryId'];
  }

  @override
  changeSelectedCategory(index, catId) {
    selectedCategoryIndex = index;
    getData(catId);
    update();
  }

  @override
  getData(categoryId) async {
    items.clear();
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await itemData.postData(
        categoryId, myServices.sharedPreferences.getString("id")!);
    print("=================== Controller $response");
    apiStatusRequest = handlingRemoteData(response);
    if (apiStatusRequest == ApiStatusRequest.success) {
      if (response['status'] == "success") {
        items.addAll(response['data']);
        print("items.length = ${items.length}");
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "there is an error in the server");
        apiStatusRequest = ApiStatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItemDetails(itemModel) {
    Get.toNamed(AppRoutes.itemsDetails, arguments: {"itemModel": itemModel});
  }
}
