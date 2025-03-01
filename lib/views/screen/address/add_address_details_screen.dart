import 'package:ecommerce_userapp/controller/address/add_address_details_controller.dart';
import 'package:ecommerce_userapp/core/class/api_manage_statuts_view.dart';
import 'package:ecommerce_userapp/views/widget/Auth/custom_button.dart';
import 'package:ecommerce_userapp/views/widget/Auth/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressDetailsScreen extends StatelessWidget {
  const AddAddressDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Address Details"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child:
            GetBuilder<AddAddressDetailsControllerImp>(builder: (controller) {
          return ApiManageStatutsRequest(
            statusRequest: controller.apiStatusRequest,
            widget: ListView(
              children: [
                CustomTextFormField(
                    label: 'Name',
                    hint: "Enter your name",
                    controller: controller.name!,
                    icon: Icon(Icons.person),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your name";
                      }
                    },
                    isNumber: false),
                CustomTextFormField(
                    label: 'City',
                    hint: "Enter your City",
                    controller: controller.city!,
                    icon: Icon(Icons.location_city),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your City";
                      }
                    },
                    isNumber: false),
                CustomTextFormField(
                    label: 'Street',
                    hint: "Enter your Street",
                    controller: controller.street!,
                    icon: Icon(Icons.streetview),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your Street";
                      }
                    },
                    isNumber: false),
                CustomButtonAuth(
                    buttonTo: "Add Address",
                    onPressed: () {
                      controller.addAddress();
                    }),
              ],
            ),
          );
        }),
      ),
    );
  }
}
