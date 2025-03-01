import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/core/class/api_crud_operations.dart';

class AddressData {
  ApiCrudOperationsModel apiCrudOperationsModel;

  AddressData(this.apiCrudOperationsModel);
  getAddressData(String userid) async {
    var response = await apiCrudOperationsModel
        .postData(ApiLinks.viewAddressEndpoint, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  addAddressData(String name, String city, String userid, String street,
      String lat, String lang) async {
    var response =
        await apiCrudOperationsModel.postData(ApiLinks.addAddressEndpoint, {
      "name": name,
      "city": city,
      "userid": userid,
      "street": street,
      "lat": lat,
      "lang": lang
    });
    return response.fold((l) => l, (r) => r);
  }

  updateAddressData(String name, String city, String addressid, String street,
      String lat, String lang) async {
    var response =
        await apiCrudOperationsModel.postData(ApiLinks.editAddressEndpoint, {
      "name": name,
      "city": city,
      "addressid": addressid,
      "street": street,
      "lat": lat,
      "lang": lang
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteAddressData(String id) async {
    var response = await apiCrudOperationsModel
        .postData(ApiLinks.deleteAddressEndpoint, {"addressid": id});
    return response.fold((l) => l, (r) => r);
  }
}
