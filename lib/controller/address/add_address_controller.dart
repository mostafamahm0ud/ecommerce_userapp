import 'dart:async';

import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  ApiStatusRequest statusRequest = ApiStatusRequest.loading;
  Completer<GoogleMapController>? mapControllerCompleter;
  Position? currentPosition;
  final List<Marker> markers = [];
  CameraPosition? cameraPosition;

  void addMarker(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId('1'), position: latLng));
    update();
  }

  Future<void> getCurrentPosition() async {
    try {
      currentPosition = await Geolocator.getCurrentPosition();
      cameraPosition = CameraPosition(
        target: LatLng(currentPosition!.latitude, currentPosition!.longitude),
        zoom: 14,
      );
      statusRequest = ApiStatusRequest.none;
      update();
    } catch (e) {
      statusRequest = ApiStatusRequest.failure;
      update();
      Get.snackbar(
        "Error",
        "Failed to fetch current location. Please check your permissions.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void goToAddressDetails() {
    if (markers.isEmpty) {
      Get.snackbar(
        "Error",
        "Please select a location on the map",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.toNamed(
      AppRoutes.addressAddDetails,
      arguments: {
        "lat": markers[0].position.latitude.toString(),
        "lng": markers[0].position.longitude.toString(),
      },
    );
  }

  @override
  void onInit() {
    mapControllerCompleter = Completer<GoogleMapController>();
    getCurrentPosition();
    super.onInit();
  }
}
