import 'package:ecommerce_userapp/controller/setting_controller.dart';
import 'package:ecommerce_userapp/core/constant/app_routes.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/constant/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends GetView<SettingControllerImp> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: AppColors.primaryColor,
                ),
                height: Get.height / 3.5,
              ),
              Positioned(
                top: Get.height / 6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.grayOpen),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.grayOpen,
                    backgroundImage: const AssetImage(AppAssets.profile),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              borderOnForeground: false,
              elevation: 0,
              clipBehavior: Clip.none,
              color: AppColors.backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 15,
                children: [
                  ListTile(
                    title: const Text('Disable Notification'),
                    trailing: Switch(
                      activeColor: AppColors.secondaryBlue,
                      value: true, onChanged: (value) {}),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.address);
                    },
                    title: const Text('Adress'),
                    trailing: const Icon(Icons.location_on),
                  ),
                  ListTile(
                    onTap: () {},
                    title: const Text('About US'),
                    trailing: const Icon(Icons.help_outline),
                  ),
                  ListTile(
                    onTap: () {},
                    title: const Text('Contact US'),
                    trailing: const Icon(Icons.phone),
                  ),
                  ListTile(
                    onTap: () {
                      controller.logOut();
                    },
                    title: const Text('Log Out'),
                    trailing: const Icon(Icons.logout),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
