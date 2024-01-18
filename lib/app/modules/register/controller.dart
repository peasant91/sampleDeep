import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../map/page.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confPassCtrl = TextEditingController();

  // final AuthAPI api = AuthAPI();

  void doLogin() async {
    Get.offAll(MapScreen());
    //   return api.login({
    //     "grant_type": "password",
    //     "username": emailCtrl.text,
    //     "password": passwordCtrl.text
    //   }).then((value) {
    //     value.saveToLocal(LoginType.user);
    //     Get.offAll(const HomePage());
    //   },
    //       onError: (e) => {
    //             Get.dialog(SecurityErrorDialog(
    //               title: e.error,
    //               desc: e.errorDescription,
    //               buttonTitle: "understand".tr,
    //               onClick: () => print("OK BYE"),
    //             ))
    //           }).onError((error, stackTrace) => null);
  }

  void doSubmit() {
    if (formKey.currentState!.validate()) {
      doLogin();
    }
  }
}
