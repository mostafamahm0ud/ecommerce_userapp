import 'package:ecommerce_userapp/controller/address/view_address_controller.dart';
import 'package:ecommerce_userapp/core/class/api_manage_statuts_view.dart';
import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/views/widget/address/address_card_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addressAdd);
        },
        child: const Icon(Icons.add, color: AppColors.white),
      ),
      body: GetBuilder<ViewAddressController>(
        builder: (controller) {
          return ApiManageStatutsRequest(
            statusRequest: controller.apiStatusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: controller.addressDataList.length,
                itemBuilder: (context, index) {
                  return AddressCardView(
                    addressModel: controller.addressDataList[index],
                    onDelete: () => controller.deleteAddress(
                      controller.addressDataList[index].addressId!.toString(),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
