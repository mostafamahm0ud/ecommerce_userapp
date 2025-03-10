import 'package:ecommerce_userapp/controller/cart/cart_controller.dart';
import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemDeteilsController extends GetxController {
  initilData();
  add();
  remove();
  goToCart();
}

class ItemDeteilsControllerImp extends ItemDeteilsController {
  ApiStatusRequest apiStatusRequest = ApiStatusRequest.none;
  CartControllerImp cartController = Get.find<CartControllerImp>();
  late ItemModel itemModel;
  int itemCount = 0;
  List subItems = [
    {
      "id": 1,
      "name": "item 1",
      "active": 1,
    },
    {
      "id": 2,
      "name": "item 2",
      "active": 0,
    },
    {
      "id": 3,
      "name": "item 3",
      "active": 0,
    },
  ];

  @override
  add() {
    cartController.addToCart(itemModel.itemsId!.toString());
    itemCount++;
    update();
  }

  @override
  remove() {
    if (itemCount > 0) {
      cartController.removeFromCart(itemModel.itemsId!.toString());
      itemCount--;
      update();
    }
  }

  @override
  void onInit() {
    initilData();
    super.onInit();
  }

  @override
  initilData() async {
    apiStatusRequest = ApiStatusRequest.loading;
    itemModel = Get.arguments['itemModel'];
    print(itemModel.toJson());
    itemCount = int.parse(
      await cartController.countItemCart(
        itemModel.itemsId!.toString(),
      ),
    );
    apiStatusRequest = ApiStatusRequest.success;
    update();
  }

  @override
  goToCart() {
    Get.toNamed(AppRoutes.cart);
  }
}
