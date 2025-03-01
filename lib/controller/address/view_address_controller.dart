import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/core/function/handling_remote_data.dart';
import 'package:ecommerce_userapp/core/services/services.dart';
import 'package:ecommerce_userapp/data/dataSource/remote/Adress/addrees_data.dart';
import 'package:ecommerce_userapp/data/model/address_model.dart';
import 'package:get/get.dart';

class ViewAddressController extends GetxController {
  ApiStatusRequest apiStatusRequest = ApiStatusRequest.loading;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  List<AddressModel> addressDataList = [];

  getData() async {
    apiStatusRequest = ApiStatusRequest.loading;
    update();
    var response = await addressData.getAddressData(
      myServices.sharedPreferences.getString("id")!,
    );
    print("=================== Controller $response");
    apiStatusRequest = handlingRemoteData(response);
    if (apiStatusRequest == ApiStatusRequest.success) {
      if (response['status'] == "success") {
        List data = response['data'];
        addressDataList.clear();
        addressDataList.addAll(data.map((e) => AddressModel.fromJson(e)));
        if (addressDataList.isEmpty) {
          apiStatusRequest = ApiStatusRequest.failure;
          update();
        }
      } else {
        apiStatusRequest = ApiStatusRequest.failure;
      }
    }
    update();
  }

  deleteAddress(String addressId) async {
    var response = await addressData.deleteAddressData(addressId);
    if (response['status'] == "success") {
      addressDataList
          .removeWhere((element) => element.addressId.toString() == addressId);
      update();
    } else {
      Get.defaultDialog(
          title: "Error", middleText: "Failed to delete the address");
    }
  }

  goToEditAddress(AddressModel addressModel) {
    Get.toNamed(AppRoutes.addressEdit,
        arguments: {"addressModel": addressModel});
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
