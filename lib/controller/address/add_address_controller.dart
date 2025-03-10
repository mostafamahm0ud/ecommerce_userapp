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
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar(
          "Error",
          "Location services are disabled. Please enable them.",
          snackPosition: SnackPosition.BOTTOM,
        );
        statusRequest = ApiStatusRequest.failure;
        update();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar(
            "Error",
            "Location permissions are denied.",
            snackPosition: SnackPosition.BOTTOM,
          );
          statusRequest = ApiStatusRequest.failure;
          update();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.snackbar(
          "Error",
          "Location permissions are permanently denied, we cannot request permissions.",
          snackPosition: SnackPosition.BOTTOM,
        );
        statusRequest = ApiStatusRequest.failure;
        update();
        return;
      }

      currentPosition = await Geolocator.getCurrentPosition();
      if (currentPosition != null) {
        cameraPosition = CameraPosition(
          target: LatLng(currentPosition!.latitude, currentPosition!.longitude),
          zoom: 14,
        );
        statusRequest = ApiStatusRequest.none;
        update();
      } else {
        statusRequest = ApiStatusRequest.failure;
        update();
        Get.snackbar(
          "Error",
          "Failed to fetch current location.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
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

    final LatLng position = markers[0].position;
    Get.toNamed(
      AppRoutes.addressAddDetails,
      arguments: {
        "lat": position.latitude.toString(),
        "lng": position.longitude.toString(),
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