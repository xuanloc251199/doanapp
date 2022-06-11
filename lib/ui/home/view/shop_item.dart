import 'package:daoan6/ui/home/model/shop.dart';
import 'package:daoan6/values/colors.dart';
import 'package:daoan6/values/dimen.dart';
import 'package:daoan6/values/fonts.dart';
import 'package:daoan6/values/images.dart';
import 'package:daoan6/widget/neu_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'rating_page.dart';

class ShopItem extends StatelessWidget {
  final Shop shop;

  const ShopItem({required this.shop});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 24),
      child: NeuButtonWidget(
        width: 147,
        height: 184,
        radius: 22,
        onPressed: () {
          Get.to(RattingPage(shop: shop)); //vào value -> image
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imgUrlBase + shop.avt,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 2.0.w),
            Text(
              shop.name,
              style: TextStyle(
                color: textBlackColor,
                fontFamily: robotoRegular,
                fontSize: normalSize,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 1.5.w,
            ),
            Text(
              shop.address,
              style: TextStyle(
                color: textGreyColor,
                fontFamily: robotoRegular,
                fontSize: smallMediumSize,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
