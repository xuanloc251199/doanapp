import 'package:daoan6/Pages/login/login_screen.dart';
import 'package:daoan6/Pages/signup/signup_screen.dart';
import 'package:daoan6/ui/auth/login/controller/login_controller.dart';
import 'package:daoan6/ui/auth/sign_up/view/sign_up_page.dart';
import 'package:daoan6/ui/main/view/main_page.dart';
import 'package:daoan6/values/colors.dart';
import 'package:daoan6/values/dimen.dart';
import 'package:daoan6/values/fonts.dart';
import 'package:daoan6/values/images.dart';
import 'package:daoan6/values/strings.dart';
import 'package:daoan6/values/styles.dart';
import 'package:daoan6/widget/bg_view.dart';
import 'package:daoan6/widget/button_gradient_widget.dart';
import 'package:daoan6/widget/neu_button_widget.dart';
import 'package:daoan6/widget/text_customized.dart';
import 'package:daoan6/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: GetBuilder<LoginController>(
        builder: (value) => AnnotatedRegion(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: _buildBody(),
          ),
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: BgView(
                choosed: 2,
              ),
            ),
            Positioned(
              child: SingleChildScrollView(
                child: _buildInputForm(),
              ),
            ),
            Positioned(
              child: Obx(
                () => controller.isLoading.value == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Text(""),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInputForm() {
    return Form(
      key: controller.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  logoApp,
                ),
                Text(
                  name_app,
                  style: TextStyle(
                    fontFamily: vigaRegular,
                    color: mainLightColor,
                    fontWeight: FontWeight.w500,
                    fontSize: largeSize,
                  ),
                ),
                Text(
                  slogan_app,
                  style: TextStyle(
                    fontFamily: semiMedium,
                    color: textBlackColor,
                    fontSize: smallMediumSize,
                  ),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                Text(
                  LOGIN_TITLE,
                  style: TextStyle(
                    fontSize: mediumSize,
                  ),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                TextFieldWidget(
                  width: Get.width,
                  height: 57.0,
                  textController: controller.emailController,
                  validator: (v) {
                    return controller.validateEmail(v!);
                  },
                  onSaved: (v) {
                    controller.password = v!;
                  },
                  bgColor: bgWhiteColor,
                  hint: EMAIL,
                  hintTextStytle: hintTextStyle,
                  borderColor: textGreyColor,
                  inputBoxShadow: BoxShadow(
                    color: shadowColor,
                    offset: Offset(15, 20),
                    blurRadius: 45,
                    spreadRadius: 0.1,
                  ),
                  isEnable: true,
                ),
                // controller.emailValid
                //     ? Container(
                //         padding: EdgeInsets.only(top: 2.0.h),
                //         child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             TextCustomized(
                //               text: controller.error,
                //               weight: FontWeight.w500,
                //               font: robotoRegular,
                //               color: mainDarkColor,
                //               size: verySmallSize,
                //               textAlign: TextAlign.left,
                //             )
                //           ],
                //         ))
                //     : Container(),
                SizedBox(
                  height: 2.0.h,
                ),
                TextFieldWidget(
                  width: Get.width,
                  height: 57.0,
                  textController: controller.passwordController,
                  validator: (v) {
                    return controller.validatePassword(v!);
                  },
                  onSaved: (v) {
                    controller.password = v!;
                  },
                  bgColor: bgWhiteColor,
                  hint: PASSWORD,
                  textInputType: TextInputType.visiblePassword,
                  isObscureText: true,
                  hintTextStytle: hintTextStyle,
                  borderColor: textGreyColor,
                  inputBoxShadow: BoxShadow(
                    color: shadowColor,
                    offset: Offset(15, 20),
                    blurRadius: 45,
                    spreadRadius: 0.1,
                  ),
                  isEnable: true,
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                Text(
                  CONTINUE_WITH,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                Container(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NeuButtonWidget(
                        isBorder: true,
                        width: 40.0.w,
                        height: 57,
                        radius: 15,
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.facebook,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 2.0.w),
                            Text(
                              FACEBOOK,
                              style: TextStyle(
                                color: textBlackColor,
                                fontFamily: robotoRegular,
                                fontSize: normalXSize,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      NeuButtonWidget(
                        isBorder: true,
                        width: 40.0.w,
                        height: 57,
                        radius: 15,
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.google,
                              color: Colors.red.shade500,
                            ),
                            SizedBox(width: 2.0.w),
                            Text(
                              GOOGLE,
                              style: TextStyle(
                                color: textBlackColor,
                                fontFamily: robotoRegular,
                                fontSize: normalXSize,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                Text(
                  FORGOT_PASSWORD,
                  style: TextStyle(
                      color: Color(0xFF53E88B),
                      decoration: TextDecoration.underline),
                ),
                SizedBox(
                  height: 2.0.h,
                ),

                GestureDetector(
                  onTap: () {
                    Get.offAll(SignUpPage());
                  },
                  child: Text(
                    SIGN_UP,
                    style: TextStyle(
                        color: Color(0xFF53E88B),
                        decoration: TextDecoration.underline),
                  ),
                ),

                SizedBox(
                  height: 4.0.h,
                ),
                ButtonGradientWidget(
                  toUpperCase: true,
                  text: LOGIN,
                  onPressed: () async {
                    controller.doLogin();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
