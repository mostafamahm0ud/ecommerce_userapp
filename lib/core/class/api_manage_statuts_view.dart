import 'package:ecommerce_userapp/core/class/api_status_request.dart';
import 'package:ecommerce_userapp/core/constant/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ApiManageStatutsRequest extends StatelessWidget {
  const ApiManageStatutsRequest(
      {super.key, required this.statusRequest, required this.widget});

  final ApiStatusRequest statusRequest;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return statusRequest == ApiStatusRequest.loading
        ? Center(child: Lottie.asset(AppAssets.loading, height: 200, width: 200))
        : statusRequest == ApiStatusRequest.offLinefailure
            ? Center(child: Lottie.asset(AppAssets.nointernet, height: 200, width: 200))
            : statusRequest == ApiStatusRequest.failure
                ? Center(child: Lottie.asset(AppAssets.nodata, height: 200, width: 200))
                : widget;
  }
}
