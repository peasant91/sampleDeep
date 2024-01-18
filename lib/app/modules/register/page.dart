import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopay/app/modules/register/controller.dart';
import 'package:kopay/app/widget/atoms/primary_button.dart';
import 'package:kopay/app/widget/molecule/blue_scaffold.dart';

import '../../widget/molecule/form_text_field.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return BlueScaffold(
        title: "Register",
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Column(
                  children: [
                    FormEmailField(ctrl: controller.emailCtrl),
                    const SizedBox(
                      height: 24,
                    ),
                    FormPasswordField(ctrl: controller.passwordCtrl),
                    const SizedBox(
                      height: 24,
                    ),
                    FormConfirmPasswordField(
                        ctrl: controller.confPassCtrl,
                        passCtrl: controller.passwordCtrl)
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16, top: 16),
                  child: PrimaryButton(
                    title: "Register",
                    onClick: () => controller.doSubmit(),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
