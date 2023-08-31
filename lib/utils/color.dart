import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  ///
  /// Main Color
  ///background: #94C419;
  static Color mainColor = const Color(0xff23208b);
  static Color secondaryColor = const Color(0xfff98611);
  static Color backgroundColor = const Color(0xff445010);
  static Color backColor = const Color(0xff000000);
  static Color whiteColor = Colors.white;
  static Color greyColor = const Color(0xffa0a0a0);
  static Color textColor = const Color(0xffCFCFCF);
  static Color mainColorText = const Color(0xff46531F);
  static Color textFieldBorderColor = const Color(0xffE0E0E0);
  static Color textFieldLabelColor = const Color(0xff9E9E9E);
  static Color backBorderColor = const Color(0xFF0F0B0B);
  // gradient color
  static Color gradientStartColor = const Color(0xffA3CB00);
  static Color gradientEndColor = const Color(0xffDDDA4C);
  static Color dashboardColor = const Color(0xFFF4F4F4);
  static Color dashboardTextColor = const Color(0xffCDFF00);
  static Color actionTextColor = const Color(0xff2B3503);
  static Color dialogButton = const Color(0xff627122);
  static Color transactionColor = const Color(0xff273240);

  static MaterialColor primarySwatch = MaterialColor(
    0xff94C419, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: mainColor, //10%
      100: mainColor, //20%
      200: mainColor, //30%
      300: mainColor, //40%
      400: mainColor, //50%
      500: mainColor, //60%
      600: mainColor, //70%
      700: mainColor, //80%
      800: mainColor, //90%
      900: mainColor, //100%
    },
  );
}
