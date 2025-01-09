import 'package:ecommerce_userapp/views/screen/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index) {}
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> pages = [
    HomePage(),
    Center(
      child: Text('Favorite'),
    ),
    Center(
      child: Text('Profile'),
    ),
    Center(
      child: Text('Settings'),
    ),
  ];

  List bottomAppBarItems = [
    Icons.home,
    Icons.favorite,
    Icons.person,
    Icons.settings,
  ];
  @override
  changePage(int index) {
    currentPage = index;
    update();
  }
}
