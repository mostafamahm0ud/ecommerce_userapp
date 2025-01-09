import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:flutter/material.dart';

class CustomHeaderAndContantAuth extends StatelessWidget {
  const CustomHeaderAndContantAuth({
    super.key,
    required this.header,
    required this.content,
  });

  final String header, content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          header,
          style: AppTextStyles.headingText24Black,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.all(15),
          child: Text(
            content,
            style: AppTextStyles.bodyContent12Gray,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
