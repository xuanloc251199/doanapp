import 'package:daoan6/Pages/payments/payments.dart';
import 'package:daoan6/ui/cart/controller/cart_controller.dart';
import 'package:daoan6/ui/home/model/menu_emblem.dart';
import 'package:daoan6/ui/home/view/notification_page.dart';
import 'package:daoan6/ui/home/view/search_page.dart';
import 'package:daoan6/values/colors.dart';
import 'package:daoan6/values/dimen.dart';
import 'package:daoan6/values/fonts.dart';
import 'package:daoan6/values/images.dart';
import 'package:daoan6/values/strings.dart';
import 'package:daoan6/widget/bg_view.dart';
import 'package:daoan6/widget/button_gradient_widget.dart';
import 'package:daoan6/widget/neu_button_widget.dart';
import 'package:daoan6/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CartPage extends GetView<CartController> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<CartController>(
        builder: (value) => AnnotatedRegion(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: _buildBody(),
            ),
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            )),
      ),
    );
  }

  Widget _buildBody() {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          child: Stack(
            children: [
              Positioned(
                child: BgView(
                  choosed: 1,
                ),
              ),
              Positioned(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8.0.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              TITLE_HOME_PAGE,
                              style: TextStyle(
                                fontFamily: robotoRegular,
                                fontSize: largeMediumSize,
                                height: normalLineSpacing,
                              ),
                            ),
                            NeuButtonWidget(
                              width: 50,
                              height: 50,
                              child: Center(
                                child: Icon(
                                  Icons.notifications_none,
                                  size: 30,
                                  color: mainDarkColor,
                                ),
                              ),
                              onPressed: () {
                                Get.to(NotificationPage());
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0.w,
                        ),
                        Container(
                          width: Get.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextFieldWidget(
                                isEnable: false,
                                width: 66.0.w,
                                height: 50,
                                prefixIcon: Icons.search,
                                prefixIconColor: orangeDarkColor,
                                hint: HINT_SEARCH_TEXT,
                                radius: 15,
                                inputBoxShadow: BoxShadow(
                                  color: shadowColor,
                                  offset: Offset(15, 20),
                                  blurRadius: 45,
                                  spreadRadius: 0.1,
                                ),
                              ),
                              NeuButtonWidget(
                                width: 50,
                                height: 50,
                                bgButton: orangeLightColor,
                                child: Center(
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: Image.asset(
                                      ic_filter,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Get.to(SearchPage());
                                },
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.0.w,
                        ),
                        Container(
                          width: Get.width,
                          height: Get.height,
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            itemCount: menuItem.length,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, i) => Container(
                              margin: EdgeInsets.only(bottom: 24),
                              child: NeuButtonWidget(
                                isBoxShadow: true,
                                width: Get.width,
                                height: 120,
                                radius: 22,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.0.w,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 64,
                                            height: 64,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Image.asset(
                                              menuItem[i].imgMenu,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3.0.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                menuItem[i].nameMenu,
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
                                                menuItem[i].nameRes,
                                                style: TextStyle(
                                                  color: textGreyColor,
                                                  fontFamily: robotoRegular,
                                                  fontSize: smallMediumSize,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: 1.5.w,
                                              ),
                                              Text(
                                                menuItem[i].price,
                                                style: TextStyle(
                                                  color: mainLightColor,
                                                  fontFamily: robotoRegular,
                                                  fontSize: largeSize,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      ButtonGradientWidget(
                                        width: 20.0.w,
                                        height: 30,
                                        padding: EdgeInsets.all(3),
                                        text: PROCCESS,
                                        size: verySmallSize,
                                        colorText: textWhiteColor,
                                        toUpperCase: true,
                                        onPressed: () {
                                          Get.to(Payments());
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3.0.w,
                        ),
                        ButtonGradientWidget(
                          width: Get.width,
                          text: CHECK_OUT,
                          colorText: textWhiteColor,
                          toUpperCase: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
