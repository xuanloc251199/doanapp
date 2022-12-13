import 'package:flutter/material.dart';

import '../../size_config.dart';

class HeaderSignUp extends StatelessWidget {
  const HeaderSignUp({Key? key,required this.title,required this.subtext}) : super(key: key);

  final String title,subtext;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getProportionateScreenHeight(38),
        ),
        Container(
          width: getProportionateScreenWidth(45),
          height: getProportionateScreenHeight(45),
          decoration: BoxDecoration(
              color: const Color(0xFFF9A84D),
              borderRadius: BorderRadius.circular(15)),
          child: const BackButton(
            color: Color(0xFFDA6317),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(25)),
        ),
        SizedBox(
          height: getProportionateScreenHeight(19),
        ),
        Text(
          subtext,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(12)),
        ),
      ],
    );
  }
}
