import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_text_themes.dart';

class WhiteButton extends StatelessWidget {
  const WhiteButton(
      {super.key,
      required this.title,
      required this.onClick,
      this.height,
      this.fitToSize,
      this.smallLabel});

  final String title;
  final Function onClick;
  final bool? fitToSize;
  final double? height;
  final bool? smallLabel;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: (fitToSize ?? false) ? height : 50,
        color: NeutralColor.n10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onPressed: () => onClick(),
        child: Text(
          title.tr,
          style: (smallLabel ?? false)
              ? titleMD
              : titleSM.copyWith(color: PrimaryColor.main),
        ));
  }
}
