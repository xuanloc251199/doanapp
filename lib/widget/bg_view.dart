import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:daoan6/values/images.dart';
import 'package:get/get.dart';

class BgView extends StatelessWidget {
  final int choosed;
  const BgView({
    Key? key,
    required this.choosed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Image.asset(
        choosed == 1 ? bgHomePage : bgChatDetail,
        fit: BoxFit.fill,
      ),
    );
  }
}
