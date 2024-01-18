import 'package:get/get.dart';

import 'modules/login/page.dart';

void doLogout() async {
  Get.offAll(const LoginScreen());
}

extension Helper on String? {
  String? getPhone() {
    return this?.replaceFirst(RegExp(r'^0+|62+|\+62+'), '');
  }

  bool isInvalidPhone() {
    if (this != null) {
      return !this!.contains(RegExp(r'(\\+628|08|8|628)([0-9]{5,12})$'));
    }
    return false;
  }

  bool isInvalidEmail() {
    if (this != null) {
      return !RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(this!);
    }
    return false;
  }
}
