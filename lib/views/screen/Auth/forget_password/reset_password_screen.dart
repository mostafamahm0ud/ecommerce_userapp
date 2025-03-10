import 'package:ecommerce_userapp/controller/forgetPassword/reset_password_controller.dart';
import 'package:ecommerce_userapp/core/class/api_manage_statuts_view.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/core/function/validata_input_funcation.dart';
import 'package:ecommerce_userapp/views/widget/Auth/custom_button.dart';
import 'package:ecommerce_userapp/views/widget/Auth/custom_header_content.dart';
import 'package:ecommerce_userapp/views/widget/Auth/custom_text_field.dart';
import 'package:ecommerce_userapp/views/widget/custom_app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset Password',
          style: AppTextStyles.bodyContent16Gray,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) => ApiManageStatutsRequest(
          statusRequest: controller.apiStatusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            child: Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  const CustomAppLogo(),
                  const CustomHeaderAndContantAuth(
                    header: 'New Password',
                    content: 'Enter your new password and confirm it below',
                  ),
                  CustomTextFormField(
                    isPassword: controller.isPassword,
                    controller: controller.password,
                    label: 'Password',
                    hint: 'Enter your Password',
                    icon: controller.isPassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.lock_outline),
                    showPassword: controller.isShowPassword,
                    validator: (value) {
                      return validataInput(value!, 30, 5, "password");
                    },
                    isNumber: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    isPassword: controller.isPassword,
                    controller: controller.password,
                    label: 'Confirm Password',
                    hint: 'Re Enter your Password',
                    icon: controller.isPassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.lock_outline),
                    showPassword: controller.isShowPassword(),
                    validator: (value) {
                      return validataInput(value!, 30, 5, "password");
                    },
                    isNumber: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButtonAuth(
                    buttonTo: 'Confirm',
                    buttonColor: AppColors.primaryColor,
                    textColor: Colors.white,
                    onPressed: controller.resetPassword,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
