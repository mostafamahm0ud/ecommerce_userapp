import 'package:ecommerce_userapp/controller/forgetPassword/success_reset_password_controller.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/views/widget/Auth/custom_button.dart';
import 'package:ecommerce_userapp/views/widget/Auth/custom_header_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPasswordSuccess extends StatelessWidget {
  const SuccessResetPasswordSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Success Reset Password',
          style: AppTextStyles.bodyContent16Gray,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: GetBuilder<SuccessResetPasswordControllerImp>(
        builder: (controller) {
          return Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              child: ListView(
                children: [
                  const Icon(Icons.check_circle_outline_sharp, size: 100, color: AppColors.primaryColor),
                  const CustomHeaderAndContantAuth(
                    header: 'Successfully',
                    content: 'Your password has been reset',
                  ),
                  const Spacer(),
                  CustomButtonAuth(
                    buttonTo: 'Sign In',
                    buttonColor: AppColors.primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      controller.goToSignIn();
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
