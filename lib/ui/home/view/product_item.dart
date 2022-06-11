import 'package:daoan6/Pages/detailproduct/detailproduct.dart';
import 'package:daoan6/ui/home/model/product.dart';
import 'package:daoan6/ui/home/model/shop.dart';
import 'package:daoan6/ui/home/view/detail_product_page.dart';
import 'package:daoan6/values/colors.dart';
import 'package:daoan6/values/dimen.dart';
import 'package:daoan6/values/fonts.dart';
import 'package:daoan6/values/images.dart';
import 'package:daoan6/values/strings.dart';
import 'package:daoan6/widget/neu_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  final Shop shop;

  const ProductItem({required this.product, required this.shop});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      child: NeuButtonWidget(
        onPressed: () {
          Get.to(DetailProductPage(
            product: product,
            shop: shop,
          ));
        },
        width: Get.width,
        height: 87,
        radius: 22,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      imgUrlBase + product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 3.0.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.name,
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
                        product.id.isEqual(shop.id) ? shop.name : GREEN_NODDLE,
                        style: TextStyle(
                          color: textGreyColor,
                          fontFamily: robotoRegular,
                          fontSize: smallMediumSize,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                product.price.toString(),
                style: TextStyle(
                  color: textOrangeColor,
                  fontFamily: robotoRegular,
                  fontSize: largeSize,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
