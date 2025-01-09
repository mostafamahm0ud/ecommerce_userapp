import 'package:ecommerce_userapp/core/class/api_status_request.dart';

handlingRemoteData(response) {
  if (response is ApiStatusRequest) {
    return response;
  } else {
    return ApiStatusRequest.success;
  }
}