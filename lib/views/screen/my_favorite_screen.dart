import 'package:ecommerce_userapp/controller/my_favorite_controller.dart';
import 'package:ecommerce_userapp/core/class/api_manage_statuts_view.dart';
import 'package:ecommerce_userapp/views/widget/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavoriteScreen extends GetView<MyFavoriteControllerImp> {
  const MyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              CustomSearchNavBar(
                onPressedSearch: () {},
                onPressedNotification: () {},
                onPressedFavorite: () {},
              ),
              GetBuilder<MyFavoriteControllerImp>(builder: (controller) {
                return ApiManageStatutsRequest(
                    statusRequest: controller.apiStatusRequest,
                    widget: Center(
                      child: Text('My Favorite Screen'),
                    ));
              }),
            ],
          )),
    );
  }
}
