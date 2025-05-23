import 'package:ecommerce_userapp/views/screen/home/home_page.dart';
import 'package:ecommerce_userapp/views/screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index) {}
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> pages = [
    const HomePage(),
    const Center(
      child: Text('Notifications'),
    ),
    const Center(
      child: Text('Profile'),
    ),
    const SettingsScreen(),
  ];

  List bottomAppBarItems = [
    Icons.home,
    Icons.notifications,
    Icons.person,
    Icons.settings,
  ];
  @override
  changePage(int index) {
    currentPage = index;
    update();
  }
}
