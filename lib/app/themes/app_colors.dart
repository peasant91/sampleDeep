import 'package:flutter/material.dart';

extension RGBA on Color {
  static Color rgba(int r, int g, int b, double opacity) {
    return Color.fromRGBO(r, g, b, opacity);
  }
}

abstract class ShadowColor {
  static final main = RGBA.rgba(0, 0, 0, 0.25);
}

abstract class PrimaryColor {
  static final main = RGBA.rgba(128, 0, 0, 1);
  static final surface = RGBA.rgba(226, 246, 255, 1);
  static final hover = RGBA.rgba(42, 140, 212, 1);
  static final pressed = RGBA.rgba(33, 91, 157, 1);
}

abstract class Warning {
  static final main = RGBA.rgba(205, 123, 46, 1);
  static final surface = RGBA.rgba(255, 242, 226, 1);
}

abstract class Info {
  static final main = RGBA.rgba(50, 103, 227, 1);
  static final surface = RGBA.rgba(225, 231, 254, 1);
}

abstract class SecondaryColor {
  static final main = RGBA.rgba(0, 148, 153, 1);
}

abstract class TertiaryColor {
  static final main = RGBA.rgba(252, 153, 24, 1);
}

abstract class DangerColor {
  static final main = RGBA.rgba(203, 58, 49, 1);
}

abstract class Success {
  static final main = RGBA.rgba(67, 147, 108, 1);
  static final surface = RGBA.rgba(214, 250, 232, 1);
}

abstract class Danger {
  static final main = RGBA.rgba(203, 58, 49, 1);
  static final surface = RGBA.rgba(255, 235, 232, 1);
}

abstract class NeutralColor {
  static final n100 = RGBA.rgba(10, 10, 10, 1);
  static final n90 = RGBA.rgba(64, 64, 64, 1);
  static final n80 = RGBA.rgba(97, 97, 97, 1);
  static final n70 = RGBA.rgba(117, 117, 117, 1);
  static final n60 = RGBA.rgba(158, 158, 158, 1);
  static final n50 = RGBA.rgba(194, 194, 194, 1);
  static final n40 = RGBA.rgba(224, 224, 224, 1);
  static final n30 = RGBA.rgba(237, 237, 237, 1);
  static final n20 = RGBA.rgba(245, 245, 245, 1);
  static final n10 = RGBA.rgba(255, 255, 255, 1);
}

abstract class OceanColor {
  static final border = RGBA.rgba(182, 231, 254, 1);
  static final pressed = RGBA.rgba(33, 91, 157, 1);
}
