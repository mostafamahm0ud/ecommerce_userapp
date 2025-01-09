import 'package:ecommerce_userapp/controller/home_controller.dart';
import 'package:ecommerce_userapp/core/class/api_manage_statuts_view.dart';
import 'package:ecommerce_userapp/views/widget/home/home_categories_list_view.dart';
import 'package:ecommerce_userapp/views/widget/home/home_discount_card.dart';
import 'package:ecommerce_userapp/views/widget/home/home_navbar.dart';
import 'package:ecommerce_userapp/views/widget/home/home_productes_to_you.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
          builder: (controller) => ApiManageStatutsRequest(
                statusRequest: controller.apiStatusRequest,
                widget: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        spacing: 10,
                        children: [
                          HomeSearchNavBar(
                            onPressedSearch: () {},
                            onPressedNotification: () {},
                          ),
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
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
