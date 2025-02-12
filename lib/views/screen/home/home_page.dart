import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_userapp/api_links.dart';
import 'package:ecommerce_userapp/controller/home/home_controller.dart';
import 'package:ecommerce_userapp/controller/search_controller.dart';
import 'package:ecommerce_userapp/core/class/api_manage_statuts_view.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/data/model/items_model.dart';
import 'package:ecommerce_userapp/views/widget/home/home_categories_list_view.dart';
import 'package:ecommerce_userapp/views/widget/home/home_discount_card.dart';
import 'package:ecommerce_userapp/views/widget/custom_navbar.dart';
import 'package:ecommerce_userapp/views/widget/home/home_productes_to_you.dart';
import 'package:ecommerce_userapp/views/widget/items/item_card.dart';
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
                      controller.searchController.onSearchItem();
                    },
                    onChanged: (value) {
                      controller.searchController.checkSearch(value);
                    },
                    mycontroller: controller.searchController.searchControllertext,
                  ),
                  ApiManageStatutsRequest(
                    statusRequest: controller.apiStatusRequest,
                    widget: controller.searchController.isSearch
                        ? SearchItemList(
                            items: controller.searchController.searchItems,
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

class SearchItemList extends GetView<SearchControllerImp> {
  const SearchItemList({super.key, required this.items});
  final List<ItemModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              controller.goToItemDetails(items[index]);
            },
            child: Row(children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: "${ApiLinks.imageItemsEndpoint}/${items[index].itemsImage}",
                  fit: BoxFit.scaleDown,
                  height: 70
                ),
              ),
              Expanded(
                flex: 2,
                child: ListTile(
                  title: Text(
                    items[index].itemsName!,
                    style: AppTextStyles.bodyContent16Black,
                  ),
                  subtitle: Text(
                    '${items[index].itemsPrice} EGP',
                    style: AppTextStyles.bodyContent12Gray,
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
