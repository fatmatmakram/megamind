import 'package:flutter/material.dart';

import '../localization/set_localization.dart';
import '../navigator/navigator.dart';

// extension Translate on String {
//   String translate() => tr(Go.navigatorKey.currentContext!, this);
// }

extension TranslateString on String {
  String tr({BuildContext? context}) {
    return SetLocalization.of(context ?? Go.navigatorKey.currentContext!)!
        .getTranslateValue(this);
  }
}
