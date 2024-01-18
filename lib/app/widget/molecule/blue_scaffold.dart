import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../helper.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_text_themes.dart';

class BlueScaffold extends StatelessWidget {
  const BlueScaffold(
      {super.key,
      required this.body,
      this.title,
      this.isCenter,
      this.bottomNavigation,
      this.floatingActionButton,
      this.onDelete,
      this.withLogout,
      this.onPressedTitle,
      this.closeIcon,
      this.titleWidget,
      this.rightMenu,
      this.onPressedBurger});

  final Widget body;
  final String? title;
  final Widget? titleWidget;
  final bool? isCenter;
  final bool? withLogout;
  final bool? closeIcon;
  final bool? rightMenu;
  final Function? onPressedBurger;
  final Function? onPressedTitle;
  final Function? onDelete;
  final Widget? bottomNavigation;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigation,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        titleSpacing:
            (titleWidget != null) ? 0 : NavigationToolbar.kMiddleSpacing,
        backgroundColor: PrimaryColor.main,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: PrimaryColor.main,
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.dark,
        ),
        elevation: 0,
        actions: <Widget>[
          (rightMenu ?? false)
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () => onPressedBurger!(),
                    child: SvgPicture.asset(
                      "assets/images/svg/icon_menu.svg",
                      fit: BoxFit.fill,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                )
              : Container(),
          (withLogout ?? false)
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () => doLogout(),
                    child: SvgPicture.asset(
                      "assets/images/svg/icon_logout_white.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container()
        ],
        title: (onPressedTitle != null && title != null)
            ? GestureDetector(
                onTap: () => onPressedTitle!(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title ?? "",
                      style: titleMD,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    SvgPicture.asset(
                        "assets/images/svg/icon_arrow_down_white.svg")
                  ],
                ),
              )
            : titleWidget ??
                Text(
                  title ?? "",
                  style: titleMD,
                ),
        centerTitle: isCenter ?? true,
        leadingWidth: (Get.currentRoute.isEmpty ||
                    Get.currentRoute == "/" ||
                    Get.currentRoute == "/MapScreen" ||
                    Get.currentRoute == "/HomePage") &&
                title == null
            ? 200
            : null,
        leading: (Get.currentRoute.isEmpty ||
                Get.currentRoute == "/" ||
                Get.currentRoute == "/MapScreen" ||
                Get.currentRoute == "/HomePage")
            ? (title == null)
                ? Padding(
                    padding: const EdgeInsets.all(16),
                    child: Image.asset(
                      "assets/images/app_icon_horizontal.png",
                      fit: BoxFit.fitHeight,
                    ),
                  )
                : null
            : IconButton(
                onPressed: () => Get.back(),
                icon: (closeIcon != null)
                    ? SvgPicture.asset("assets/images/svg/icon_close.svg")
                    : Image.asset("assets/images/white_arrow_back.png"),
              ),
      ),
      body: SafeArea(child: body),
      // body: AnnotatedRegion(
      //   value: SystemUiOverlayStyle.dark,
      //   child: body,
    );
  }
}
