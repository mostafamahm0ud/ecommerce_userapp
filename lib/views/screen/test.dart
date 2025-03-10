import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/controller/test_controller.dart';
import 'package:ecommerce_userapp/core/class/api_manage_statuts_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: GetBuilder<TestControllerImp>(builder: (controller) {
        return ApiManageStatutsRequest(
          statusRequest: controller.apiStatusRequest,
          widget: Center(
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Test Screen"),
                  SvgPicture.network(
                    "${ApiLinks.imageCategoriesEndpoint}/pcs.svg",
                    fit: BoxFit.none,
                    height: 100,
                    width: 100,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
