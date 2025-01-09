import 'package:ecommerce_userapp/controller/Auth/sign_in_controller.dart';
import 'package:ecommerce_userapp/core/class/api_manage_statuts_view.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/core/function/validata_input_funcation.dart';
import 'package:ecommerce_userapp/views/widget/Auth/custom_button.dart';
import 'package:ecommerce_userapp/views/widget/Auth/custom_header_content.dart';
import 'package:ecommerce_userapp/views/widget/Auth/custom_text_field.dart';
import 'package:ecommerce_userapp/views/widget/Auth/have_or_not_have_account.dart';
import 'package:ecommerce_userapp/views/widget/custom_app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign In',
            style: AppTextStyles.bodyContent16Gray,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
        ),
        body: GetBuilder<SignInControllerImp>(
          builder: (controller) => ApiManageStatutsRequest(
            statusRequest: controller.apiStatusRequest,
            widget: Container(
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                    child: Form(
                      key: controller.formKey,
                      child: ListView(
                        children: [
                          CustomAppLogo(),
                          CustomHeaderAndContantAuth(
                            header: 'Welcome Back',
                            content:
                                'Sign in with your email and password OR Containue  with your Social Media Account',
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
                            isPassword: controller.isPassword,
                            controller: controller.password,
                            label: 'Password',
                            hint: 'Enter your Password',
                            icon: controller.isPassword
                                ? Icon(Icons.visibility)
                                : Icon(Icons.lock_outline),
                            showPassword: controller.isShowPassword,
                            validator: (value) {
                              return validataInput(value!, 30, 5, "password");
                            },
                            isNumber: false,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: controller.goToForgetPassword,
                            child: Text(
                              'Forgot Password',
                              style: AppTextStyles.bodyContent12Gray,
                              textAlign: TextAlign.end,
                            ),
                          ),
                          CustomButtonAuth(
                            buttonTo: 'Sign In',
                            buttonColor: AppColors.primaryColor,
                            textColor: Colors.white,
                            onPressed: controller.signIn,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          HaveOrNotHaveAccount(
                            haveOrNotHaveAccount: false,
                            onTap: controller.goToSignUp,
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ));
  }
}
