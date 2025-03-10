import 'package:ecommerce_userapp/controller/address/add_address_details_controller.dart';
import 'package:ecommerce_userapp/core/class/api_manage_statuts_view.dart';
import 'package:ecommerce_userapp/core/class/api_status_request.dart';
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
        title: const Text("Add Address Details"),
      ),
      body: GetBuilder<AddAddressDetailsControllerImp>(
        builder: (controller) {
          return ApiManageStatutsRequest(
            statusRequest: controller.apiStatusRequest,
            widget: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: controller.formKey,
                child: ListView(
                  children: [
                    CustomTextFormField(
                      label: 'Name',
                      hint: "Enter your name",
                      controller: controller.name,
                      icon: const Icon(Icons.person),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                      isNumber: false,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      label: 'City',
                      hint: "Enter your city",
                      controller: controller.city,
                      icon: const Icon(Icons.location_city),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your city";
                        }
                        return null;
                      },
                      isNumber: false,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      label: 'Street',
                      hint: "Enter your street",
                      controller: controller.street,
                      icon: const Icon(Icons.streetview),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your street";
                        }
                        return null;
                      },
                      isNumber: false,
                    ),
                    const SizedBox(height: 20),
                    CustomButtonAuth(
                      buttonTo: "Add Address",
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.addAddress();
                        }
                      },
                      isLoading: controller.apiStatusRequest ==
                          ApiStatusRequest.loading,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
