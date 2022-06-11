import 'package:daoan6/data/network/network_config.dart';
import 'package:daoan6/data/repositories/auth_repositories.dart';
import 'package:daoan6/data/request/auth_request.dart';
import 'package:daoan6/network_service/auth_services.dart';
import 'package:daoan6/ui/main/view/main_page.dart';
import 'package:daoan6/values/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  String KEY_NAME = "name";

  bool emailValid = false;
  bool passwordValid = false;
  final loginFormKey = GlobalKey<FormState>();
  final storage = FlutterSecureStorage();
  String error = "";

  String email = ' ';
  String password = ' ';

  var loginProcess = false.obs;

  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      emailValid == false;
      return error = ERROR_EMAIL;
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.length <= 5) {
      passwordValid == false;
      return error = ERROR_PASSWORD;
    } else {
      return null;
    }
  }

  doLogin() async {
    bool isValidate = loginFormKey.currentState!.validate();

    if (isValidate) {
      isLoading(true);
      try {
        var data = await AuthServices.login(
          email: emailController.text,
          password: passwordController.text,
        );

        if (data != null) {
          await storage.write(key: "name", value: data.user.name);
          await storage.write(key: "token", value: data.token);
          loginFormKey.currentState!.save();
          Get.to(MainPage());
        } else {
          Get.snackbar(LOGIN, ERROR_LOGIN);
        }
      } finally {
        isLoading(false);
      }
    }
  }
}


// Future<String> login(
  //     {required String email, required String password}) async {
  //   error = "";
  //   try {
  //     loginProcess(true);
  //     List loginResp =
  //         await AuthServices.login(email: email, password: password);
  //     if (loginResp[0] != "") {
  //       //success
  //       final prefs = await SharedPreferences.getInstance();
  //       prefs.setString("token", loginResp[0]);
  //       Get.to(MainPage());
  //     } else {
  //       error = loginResp[1];
  //     }
  //   } finally {
  //     loginProcess(false);
  //   }
  //   return error;
  // }

  // Future<bool> refresh() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString("token");

  //   if (token == null) {
  //     return false;
  //   }

  //   bool success = false;
  //   try {
  //     loginProcess(true);
  //     List loginResp = await AuthServices.refreshToken(token: token);
  //     if (loginResp[0] != "") {
  //       //success
  //       final prefs = await SharedPreferences.getInstance();
  //       prefs.setString("token", loginResp[0]);
  //       success = true;
  //     }
  //   } finally {
  //     loginProcess(false);
  //   }
  //   return success;
  // }

  // Future<void> onCheckLogin() async {
  //   if (!email.text.isNotEmpty) {
  //     phoneNumberValid = true;
  //     error = ERROR_LOGIN;
  //     Get.snackbar(LOGIN, ERROR_LOGIN);
  //   } else
  //     phoneNumberValid = false;

  //   if (!password.text.isNotEmpty) {
  //     passwordValid = true;
  //     Get.snackbar(LOGIN, ERROR_LOGIN);
  //   } else
  //     passwordValid = false;

  //   if (passwordValid == false && phoneNumberValid == false) {
  //     // login(email: email.text, password: password.text);
  //     // if (loginFormKey.currentState!.validate()) {
  //     //   String error = await login(email: email.text, password: password.text);
  //     //   if (error != "") {
  //     //     Get.defaultDialog(title: "Oop!", middleText: error);
  //     //   } else {
  //     //     Get.to(MainPage());
  //     //   }
  //     // }
  //   } else {
  //     passwordValid = true;
  //     Get.snackbar(LOGIN, "faile");
  //   }
  //   update();
  // }
