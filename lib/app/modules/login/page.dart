import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopay/app/themes/app_colors.dart';
import 'package:kopay/app/themes/app_text_themes.dart';
import 'package:kopay/app/widget/atoms/white_button.dart';
import 'package:kopay/app/widget/molecule/form_text_field.dart';

import 'controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
        backgroundColor: PrimaryColor.main,
        appBar: null,
        body: SafeArea(
            child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: Get.width / 2,
                  child: Image.asset("assets/images/logo.png")),
              const SizedBox(
                height: 32,
              ),
              Center(
                child: Text(
                  "PDP Masa Tanam Kopi",
                  style: titleLG.copyWith(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: NeutralColor.n10,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: FormCodeField(ctrl: controller.codeCtrl),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: WhiteButton(
                      title: "Buka",
                      onClick: () {
                        controller.doSubmit();
                      }),
                ),
              )
            ],
          ),
        )));
  }
}
