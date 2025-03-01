import 'package:ecommerce_userapp/controller/home/home_controller.dart';
import 'package:ecommerce_userapp/core/class/api_manage_statuts_view.dart';
import 'package:ecommerce_userapp/views/widget/home/home_categories_list_view.dart';
import 'package:ecommerce_userapp/views/widget/home/home_discount_card.dart';
import 'package:ecommerce_userapp/views/widget/custom_navbar.dart';
import 'package:ecommerce_userapp/views/widget/home/home_productes_to_you.dart';
import 'package:ecommerce_userapp/views/widget/search_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) => SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                spacing: 10,
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
                  ApiManageStatutsRequest(
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
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DiscountCard(
                                title: 'summer sale',
                                subtitle: 'Up To 20% off',
                              ),
                              CategoriesHomeListView(),
                              ProductHomeListView(
                                sectiontitle: 'producte to you',
                              ),
                              ProductHomeListView(
                                sectiontitle: 'offers',
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
