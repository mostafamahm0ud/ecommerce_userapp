import 'package:ecommerce_userapp/controller/item/item_controller.dart';
import 'package:ecommerce_userapp/core/class/api_manage_statuts_view.dart';
import 'package:ecommerce_userapp/views/widget/custom_navbar.dart';
import 'package:ecommerce_userapp/views/widget/items/grid_view_item_list.dart';
import 'package:ecommerce_userapp/views/widget/items/list_category_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          // CustomSearchNavBar(
          //   onPressedSearch: () {},
          // ),
          SizedBox(height: 8),
          ListCategoriesItem(),
          SizedBox(height: 8),
          GetBuilder<ItemControllerImp>(builder: (controller) {
            return ApiManageStatutsRequest(
                statusRequest: controller.apiStatusRequest,
                widget: GridViewItemList());
          }),
        ],
      ),
    )));
  }
}
