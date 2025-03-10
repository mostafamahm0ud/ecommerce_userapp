import 'package:ecommerce_userapp/controller/Auth/veryfiy_code_signup_controller.dart';
import 'package:ecommerce_userapp/core/class/api_manage_statuts_view.dart';
import 'package:ecommerce_userapp/core/constant/colors.dart';
import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/views/widget/Auth/custom_header_content.dart';
import 'package:ecommerce_userapp/views/widget/custom_app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerfiyCodeSignUpEmailScreen extends StatelessWidget {
  const VerfiyCodeSignUpEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Confirm Email',
          style: AppTextStyles.bodyContent16Gray,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(builder: (controller) {
        return ApiManageStatutsRequest(
          statusRequest: controller.apiStatusRequest,
          widget: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              child: ListView(
                children: [
                  const CustomAppLogo(),
                  CustomHeaderAndContantAuth(
                    header: 'Confirm Email',
                    content:
                        'Enter the code that has been sent to\n${controller.email}',
                  ),
                  OtpTextField(
                    fieldWidth: 50.0,
                    numberOfFields: 5,
                    borderColor: AppColors.primaryColor,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      controller.goToSuccessSignUp(verificationCode);
                    }, // end onSubmit
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Did not receive the code?',
                          style: AppTextStyles.bodyContent16Gray),
                      InkWell(
                          onTap: () {
                            controller.reSendEmail();
                          },
                          child: Text('Resend Code',
                              style: AppTextStyles.bodyContent16Primary)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
