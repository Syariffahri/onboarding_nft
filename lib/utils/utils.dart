import 'package:flutter/material.dart';

class Utils {
  static String imageAssets = 'assets/images/';
  static Color indicatorColor = const Color(0xffD9D9D9);
}

double getHeight(BuildContext context) {
  return MediaQuery.sizeOf(context).height;
}

double getWidth(BuildContext context) {
  return MediaQuery.sizeOf(context).width;
}
