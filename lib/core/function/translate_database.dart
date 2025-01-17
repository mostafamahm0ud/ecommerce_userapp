import 'package:ecommerce_userapp/core/services/services.dart';
import 'package:get/get.dart';

translateDataBase(columnar, columnen) {
  MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString("language") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
