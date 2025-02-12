import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> initServices() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

Future<void> initializeServices() async {
  await Get.putAsync(() => MyServices().initServices());
}
