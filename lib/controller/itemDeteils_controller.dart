import 'package:ecommerce_userapp/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemDeteilsController extends GetxController {
  initilData();
}

class ItemDeteilsControllerImp extends ItemDeteilsController {
  late ItemModel itemModel;
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
