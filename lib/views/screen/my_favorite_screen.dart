import 'package:ecommerce_userapp/controller/favorite/my_favorite_controller.dart';
import 'package:ecommerce_userapp/core/class/api_manage_statuts_view.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/views/widget/custom_navbar.dart';
import 'package:ecommerce_userapp/views/widget/items/my_favorite_item.dart';
import 'package:ecommerce_userapp/views/widget/search_card.dart';
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
                onPressedSearch: () {
                  controller.onSearchItem();
                },
                onChanged: (value) {
                  controller.checkSearch(value);
                },
                mycontroller: controller.searchController,
              ),
              const SizedBox(height: 8),
              Text(
                'Favorite Items',
                style: AppTextStyles.headingText24Black,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              GetBuilder<MyFavoriteControllerImp>(builder: (controller) {
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
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.7,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.myFavoriteList.length,
                          itemBuilder: (context, index) {
                            return MyFavoriteItemCard(
                              item: controller.myFavoriteList[index],
                            );
                          },
                        ),
                );
              }),
            ],
          )),
    );
  }
}
