import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kopay/app/constants.dart';
import 'package:kopay/app/modules/login/page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kopay/app/modules/map/page.dart';
import 'firebase_options.dart';

import 'app/themes/app_colors.dart';

void main() async {
  await GetStorage.init();
  GetStorage box = GetStorage();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(GetMaterialApp(
      // home: box.hasData(Constants.userClient)
      //     ? const MapScreen()
      //     : const LoginScreen(),
      // : const TopPage(),
      home: const LoginScreen(),
      // translations: Languages(),
      locale: const Locale("en", "US"),
      fallbackLocale: const Locale("en", "US"),
      theme: ThemeData(
          fontFamily: "Inter",
          primaryColor: PrimaryColor.main,
          scaffoldBackgroundColor: Colors.white)));
}
