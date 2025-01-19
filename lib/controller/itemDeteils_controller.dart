import 'package:ecommerce_userapp/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemDeteilsController extends GetxController {
  initilData();
}

class ItemDeteilsControllerImp extends ItemDeteilsController {
  late ItemModel itemModel;
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
  void onInit() {
    initilData();
    super.onInit();
  }

  @override
  initilData() {
    itemModel = Get.arguments['itemModel'];
    print(itemModel.toJson());
  }
}
