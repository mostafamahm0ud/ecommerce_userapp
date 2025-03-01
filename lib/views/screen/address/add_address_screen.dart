import 'package:ecommerce_userapp/controller/address/add_address_controller.dart';
import 'package:ecommerce_userapp/core/class/api_manage_statuts_view.dart';
import 'package:ecommerce_userapp/views/widget/Auth/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAddScreen extends StatelessWidget {
  const AddressAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Address"),
      ),
      body: GetBuilder<AddAddressController>(
        builder: (controller) {
          return ApiManageStatutsRequest(
            statusRequest: controller.statusRequest,
            widget: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                if (controller.cameraPosition != null)
                  Expanded(
                    child: GoogleMap(
                      mapType: MapType.normal,
                      markers: controller.markers.toSet(),
                      onTap: (LatLng latLng) => controller.addMarker(latLng),
                      initialCameraPosition: controller.cameraPosition!,
                      onMapCreated: (GoogleMapController mapController) {
                        controller.mapControllerCompleter!
                            .complete(mapController);
                      },
                    ),
                  ),
                Positioned(
                  bottom: 15,
                  child: CustomButtonAuth(
                    buttonTo: "Complete Address",
                    onPressed: controller.goToAddressDetails,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
