import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kopay/app/constants.dart';
import 'package:kopay/app/data/marker/marker.dart';
import 'package:kopay/app/modules/map/page.dart';
import 'package:kopay/app/widget/molecule/common_error_dialog.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final codeCtrl = TextEditingController();

  final db = FirebaseFirestore.instance;
  final box = GetStorage();

  // final AuthAPI api = AuthAPI();

  void doLogin() async {
    await db
        .collection("data")
        .doc(codeCtrl.text.toUpperCase())
        .collection("markers")
        .get()
        .then((doc) async {
      await box.write(Constants.userClient, codeCtrl.text.toUpperCase());

      Get.offAll(const MapScreen());
    });
  }

  void doSubmit() {
    if (formKey.currentState!.validate()) {
      doLogin();
    }
  }
}
