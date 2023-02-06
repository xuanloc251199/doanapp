import 'package:http/http.dart' as http;

import 'package:daoan6/network_service/auth_services.dart';
import 'package:daoan6/ui/main/view/main_page.dart';
import 'package:daoan6/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignUpController extends GetxController {
  var isLoading = false.obs;
  final registerFormkey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController cPasswordController;

  String name = ' ';
  String email = ' ';
  String password = ' ';
  String cPassword = ' ';

  bool nameValid = false;
  bool emailValid = false;
  bool passwordValid = false;
  String error = "";

  final storage = FlutterSecureStorage();

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    cPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    cPasswordController.dispose();
    super.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      emailValid == false;
      return ERROR_EMAIL;
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.length <= 5) {
      return ERROR_PASSWORD;
    } else {
      return null;
    }
  }

  doRegister() async {
    bool isValidate = registerFormkey.currentState!.validate();

    if (isValidate) {
      isLoading(true);
      try {
        var data = await AuthServices.register(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          confirmPassword: cPasswordController.text,
        );

        if (data != null) {
          await storage.write(key: "name", value: data.user.name);
          await storage.write(key: "token", value: data.token);
          registerFormkey.currentState!.save();
          Get.to(MainPage());
        } else {
          Get.snackbar("Register", "false");
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
