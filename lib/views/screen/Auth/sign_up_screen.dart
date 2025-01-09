import 'package:ecommerce_userapp/controller/Auth/sign_up_controller.dart';
import 'package:ecommerce_userapp/core/class/api_manage_statuts_view.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/core/function/validata_input_funcation.dart';
import 'package:ecommerce_userapp/views/widget/Auth/custom_button.dart';
import 'package:ecommerce_userapp/views/widget/Auth/custom_header_content.dart';
import 'package:ecommerce_userapp/views/widget/Auth/custom_text_field.dart';
import 'package:ecommerce_userapp/views/widget/Auth/have_or_not_have_account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: AppTextStyles.bodyContent16Gray,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) =>  ApiManageStatutsRequest(
          statusRequest: controller.apiStatusRequest,
          widget: Container(
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  child: Form(
                    key: controller.formKey,
                    child: ListView(
                      children: [
                        CustomHeaderAndContantAuth(
                          header: 'Register Now',
                          content: 'Sign up with your email and password',
                        ),
                        CustomTextFormField(
                          controller: controller.userName,
                          label: 'User Name',
                          hint: 'Enter your User Name',
                          icon: Icon(Icons.person_outline),
                          validator: (value) {
                            return validataInput(value!, 30, 5, "userName");
                          },
                          isNumber: false,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: controller.email,
                          label: 'Email',
                          hint: 'Enter your email address',
                          icon: Icon(Icons.email_outlined),
                          validator: (value) {
                            return validataInput(value!, 30, 5, "email");
                          },
                          isNumber: false,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: controller.phoneNumber,
                          label: 'Phone',
                          hint: 'Enter your Phone Number',
                          icon: Icon(Icons.phone_android_outlined),
                          validator: (value) {
                            return validataInput(value!, 11, 11, "Phone");
                          },
                          isNumber: true,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          isPassword: controller.isPassword,
                          controller: controller.password,
                          label: 'Password',
                          hint: 'Enter your Password',
                          icon: controller.isPassword
                              ? Icon(Icons.visibility)
                              : Icon(Icons.lock_outline),
                          showPassword: controller.showPassword,
                          validator: (value) {
                            return validataInput(value!, 30, 8, "password");
                          },
                          isNumber: false,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButtonAuth(
                          buttonTo: 'Sign Up',
                          buttonColor: AppColors.primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            controller.signUp();
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HaveOrNotHaveAccount(
                          haveOrNotHaveAccount: true,
                          onTap: controller.goToSignIn,
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
