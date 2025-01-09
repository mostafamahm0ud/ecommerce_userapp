import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:flutter/material.dart';

class HaveOrNotHaveAccount extends StatelessWidget {
  const HaveOrNotHaveAccount({
    super.key,
    required this.haveOrNotHaveAccount,required this.onTap,
  });

  final bool haveOrNotHaveAccount;
  final void Function() onTap; 

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          haveOrNotHaveAccount ? 'Have an account?' : 'Don\'t have an account?',
          style: AppTextStyles.bodyContent12Gray,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            haveOrNotHaveAccount ? 'Sign In' : 'Sign Up',
            style: AppTextStyles.bodyContent12Primary,
          ),
        ),
      ],
    );
  }
}
