import 'package:ecommerce_userapp/controller/item/item_controller.dart';
import 'package:ecommerce_userapp/core/class/api_manage_statuts_view.dart';
import 'package:ecommerce_userapp/views/widget/custom_navbar.dart';
import 'package:ecommerce_userapp/views/widget/items/grid_view_item_list.dart';
import 'package:ecommerce_userapp/views/widget/items/list_category_items.dart';
import 'package:ecommerce_userapp/views/widget/search_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsScreen extends GetView<ItemControllerImp> {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          CustomSearchNavBar(
            onPressedSearch: () {
              controller.onSearchItem();
            },
            onChanged: (value) {
              controller.checkSearch(value);
            },
            mycontroller: controller.searchController,
          ),
          const SizedBox(height: 8),
          const ListCategoriesItem(),
          const SizedBox(height: 8),
          GetBuilder<ItemControllerImp>(builder: (controller) {
            return ApiManageStatutsRequest(
                statusRequest: controller.apiStatusRequest,
                widget: controller.isSearch
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.searchItems.length,
                        itemBuilder: (context, index) {
                          return SearchCard(
                            items: controller.searchItems[index],
                            onTap: () {
                              controller.goToItemDetails(
                                  controller.searchItems[index]);
                            },
                          );
                        },
                      )
                    : const GridViewItemList());
          }),
        ],
      ),
    )));
  }
}
