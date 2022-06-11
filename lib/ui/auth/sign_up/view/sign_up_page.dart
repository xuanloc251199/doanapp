import 'package:daoan6/Pages/signup/signup_process_screen.dart';
import 'package:daoan6/ui/auth/login/controller/login_controller.dart';
import 'package:daoan6/ui/auth/login/view/login_page.dart';
import 'package:daoan6/ui/auth/sign_up/controller/sign_up_controller.dart';
import 'package:daoan6/values/colors.dart';
import 'package:daoan6/values/dimen.dart';
import 'package:daoan6/values/fonts.dart';
import 'package:daoan6/values/images.dart';
import 'package:daoan6/values/strings.dart';
import 'package:daoan6/values/styles.dart';
import 'package:daoan6/widget/bg_view.dart';
import 'package:daoan6/widget/button_gradient_widget.dart';
import 'package:daoan6/widget/text_customized.dart';
import 'package:daoan6/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:sizer/sizer.dart';

class SignUpPage extends GetView<SignUpController> {
  SignUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: GetBuilder<SignUpController>(
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
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.w),
                  child: Form(
                    key: controller.registerFormkey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          SIGN_UP_TITLE,
                          style: TextStyle(
                            fontSize: mediumSize,
                          ),
                        ),
                        SizedBox(
                          height: 5.0.h,
                        ),
                        TextFieldWidget(
                          textController: controller.nameController,
                          isObscureText: false,
                          onSaved: (v) {
                            controller.name = v!;
                          },
                          width: Get.width,
                          height: 57.0,
                          bgColor: bgWhiteColor,
                          hint: USERNAME,
                          hintTextStytle: hintTextStyle,
                          borderColor: textGreyColor,
                          inputBoxShadow: BoxShadow(
                            color: shadowColor,
                            offset: Offset(15, 20),
                            blurRadius: 45,
                            spreadRadius: 0.1,
                          ),
                          isEnable: true,
                          isPrefix: true,
                          prefixIcon: Icons.person,
                          prefixIconColor: mainDarkColor,
                        ),
                        SizedBox(
                          height: 2.0.h,
                        ),
                        TextFieldWidget(
                          textController: controller.emailController,
                          invalid: controller.emailValid,
                          validator: (v) {
                            return controller.validateEmail(v!);
                          },
                          onSaved: (v) {
                            controller.email = v!;
                          },
                          width: Get.width,
                          height: 57.0,
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
                          isPrefix: true,
                          prefixIcon: Icons.email,
                          prefixIconColor: mainDarkColor,
                        ),
                        SizedBox(
                          height: 2.0.h,
                        ),
                        TextFieldWidget(
                          textController: controller.passwordController,
                          invalid: controller.passwordValid,
                          isObscureText: true,
                          validator: (v) {
                            return controller.validatePassword(v!);
                          },
                          onSaved: (v) {
                            controller.password = v!;
                          },
                          width: Get.width,
                          height: 57.0,
                          bgColor: bgWhiteColor,
                          hint: PASSWORD,
                          hintTextStytle: hintTextStyle,
                          borderColor: textGreyColor,
                          inputBoxShadow: BoxShadow(
                            color: shadowColor,
                            offset: Offset(15, 20),
                            blurRadius: 45,
                            spreadRadius: 0.1,
                          ),
                          isEnable: true,
                          isPrefix: true,
                          prefixIcon: Icons.lock,
                          prefixIconColor: mainDarkColor,
                        ),
                        TextFieldWidget(
                          textController: controller.cPasswordController,
                          invalid: controller.passwordValid,
                          isObscureText: true,
                          validator: (v) {
                            return controller.validatePassword(v!);
                          },
                          onSaved: (v) {
                            controller.cPassword = v!;
                          },
                          width: Get.width,
                          height: 57.0,
                          bgColor: bgWhiteColor,
                          hint: C_PASSWORD,
                          hintTextStytle: hintTextStyle,
                          borderColor: textGreyColor,
                          inputBoxShadow: BoxShadow(
                            color: shadowColor,
                            offset: Offset(15, 20),
                            blurRadius: 45,
                            spreadRadius: 0.1,
                          ),
                          isEnable: true,
                          isPrefix: true,
                          prefixIcon: Icons.lock,
                          prefixIconColor: mainDarkColor,
                        ),
                        SizedBox(
                          height: 4.0.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RoundCheckBox(
                              size: 25,
                              checkedColor: mainLightColor,
                              borderColor: mainLightColor,
                              onTap: (selected) {},
                            ),
                            SizedBox(
                              width: 2.0.w,
                            ),
                            Text(
                              KEEP_ME,
                              style: TextStyle(
                                color: textGreyColor,
                                fontSize: smallMediumSize,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.0.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RoundCheckBox(
                              size: 25,
                              checkedColor: mainLightColor,
                              borderColor: mainLightColor,
                              onTap: (selected) {},
                            ),
                            SizedBox(
                              width: 2.0.w,
                            ),
                            Text(
                              EMAIL_ME,
                              style: TextStyle(
                                color: textGreyColor,
                                fontSize: smallMediumSize,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4.0.h,
                        ),
                        ButtonGradientWidget(
                          toUpperCase: true,
                          text: SIGN_UP,
                          onPressed: () {
                            controller.doRegister();
                          },
                        ),
                        SizedBox(
                          height: 2.0.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ALREADY_ACC,
                              style: TextStyle(
                                color: Color(0xFF000000),
                              ),
                            ),
                            SizedBox(
                              width: 2.0.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.off(LoginPage());
                              },
                              child: Text(
                                LOGIN,
                                style: TextStyle(
                                    color: Color(0xFF53E88B),
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
}

class _Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
  }
}
