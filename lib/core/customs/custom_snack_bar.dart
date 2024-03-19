import 'package:flutter/material.dart';

import '../localization/localization_methods.dart';
import '../navigator/navigator.dart';
import '../res/color_manager.dart';
import '../res/constans_manager.dart';
import '../res/text_style_manager.dart';

void showSnackBar(String message, {Color? backgroundColor}) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: ConstantsManager.snackBarDuration),
    content: Text(message, style: TextStyleManager.snackBarStyle),
    backgroundColor: backgroundColor ?? ColorManager.black.withOpacity(.5),
    behavior: SnackBarBehavior.floating,
    elevation: ConstantsManager.snackBarElevation,
    action: SnackBarAction(
      label: tr(Go.navigatorKey.currentContext!, "cancele"),
      disabledTextColor: Colors.white,
      textColor: Colors.white,
      onPressed: () => ScaffoldMessenger.of(Go.navigatorKey.currentContext!)
          .clearSnackBars(),
    ),
  );
  ScaffoldMessenger.of(Go.navigatorKey.currentContext!).showSnackBar(snackBar);
}


