import 'package:ecommerce_userapp/controller/home/home_screen_controller.dart';
import 'package:ecommerce_userapp/views/widget/home/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) {
      return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(controller.pages.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Expanded(
                      flex: 5,
                      child:  SizedBox(),
                    )
                  : Expanded(
                      flex: 4,
                      child: CustomButtomAppBarPages(
                        isSelected: controller.currentPage == i,
                        icon: controller.bottomAppBarItems[i],
                        onPressed: () {
                          controller.changePage(i);
                        },
                      ),
                    );
            }),
          ],
        ),
      );
    });
  }
}
