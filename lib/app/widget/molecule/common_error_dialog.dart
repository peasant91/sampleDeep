import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopay/app/themes/app_colors.dart';
import 'package:kopay/app/themes/app_text_themes.dart';
import 'package:kopay/app/widget/atoms/primary_button.dart';

class CommonErrorDialog extends StatelessWidget {
  const CommonErrorDialog(
      {super.key,
      required this.iconName,
      required this.title,
      required this.desc,
      required this.buttonTitle,
      required this.onClick});
  final String iconName;
  final String title;
  final String desc;
  final String buttonTitle;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  // SvgPicture.asset(iconName),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  Text(
                    title,
                    style: titleMD.copyWith(
                        decoration: TextDecoration.none,
                        fontSize: 18,
                        color: NeutralColor.n90,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    desc,
                    style: bodyMD.copyWith(
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        color: NeutralColor.n80,
                        fontWeight: FontWeight.w400),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: PrimaryButton(
                    title: buttonTitle,
                    onClick: () {
                      Get.back();
                      onClick();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
