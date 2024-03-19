import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'style_manager.dart';

abstract class TextStyleManager {
  // TEXT STYLE FOR BASE

  /// 1 - TEXT LABEL STYLE FOR TEXTFIELD 14
  static final TextStyle labelFieldStyle = regularFont(
    color: ColorManager.grey,
    fontSized: FontSize.s12,
  );

  /// 2 - TEXT HINT STYLE FOR TEXTFIELD 12
  static final TextStyle hintFieldStyle = regularFont(
    color: ColorManager.greyNav,
    fontSized: FontSize.s10,
  );

  /// 3 - LOADING BUTTON TITLE STYLE 14
  static final TextStyle loadingButtonStyle = regularFont(
    color: ColorManager.white,
    fontSized: FontSize.s12,
  );

  /// 4 - DEFAULT BUTTON TITLE STYLE 14
  static final TextStyle defaultButtonStyle = regularFont(
    color: ColorManager.white,
    fontSized: FontSize.s14,
  );

  /// 5 - DROPDOWN STYLE 12
  static final TextStyle dropDownStyle = boldFont(
    color: ColorManager.primary,
    fontSized: FontSize.s12,
  );

  /// 6 - DROPDOWN ITEM STYLE 12
  static final TextStyle dropdownItemStyle = mediumFont(
    color: ColorManager.fields,
    fontSized: FontSize.s12,
  );

  /// 7 - SEARCH BOX STYLE 12
  static final TextStyle searchBoxStyle = mediumFont(
    color: ColorManager.fields,
    fontSized: FontSize.s12,
  );

  /// 8 - DROPDOWN POPUP STYLE 12
  static final TextStyle popUpDropDownStyle = mediumFont(
    color: ColorManager.black,
    fontSized: FontSize.s12,
  );

  /// 8 - DROPDOWN LABEL STYLE 12
  static final TextStyle dropDownLabelStyle = mediumFont(
    color: ColorManager.fields,
    fontSized: FontSize.s12,
  );

  /// 8 - DROPDOWN HINT STYLE 12
  static final TextStyle dropDownHintStyle = regularFont(
    color: ColorManager.hints,
    fontSized: FontSize.s12,
  );

  /// 9 - SNACKBAR STYLE 12
  static final TextStyle snackBarStyle = mediumFont(
    color: ColorManager.white,
    fontSized: FontSize.s12,
  );

  static final TextStyle errorStyle = regularFont(
    color: Colors.red,
    fontSized: FontSize.s10,
  );

//----------------------------------------- DYNAMIC TEXT STYLE FOR APP ----------------------------------------------
  ///  1 - TEXT STYLE FOR PRIMARY COLOR 12
  static final TextStyle primaryStyle = regularFont(
    color: ColorManager.primary,
    fontSized: FontSize.s12,
  );


  ///  3 - TEXT STYLE FOR titlesStyle COLOR 14
  static final TextStyle titlesStyle = regularFont(
    color: ColorManager.black,
    fontSized: FontSize.s16,
  );



  ///  5 - TEXT STYLE FOR SECONDARY COLOR 10
  static final TextStyle tinyStyle = mediumFont(
    color: ColorManager.secondry,
    fontSized: FontSize.s10,
  );

  ///  6 - TEXT STYLE FOR appBarStyle COLOR 18
  static final TextStyle appBarStyle = regularFont(
    color: ColorManager.black,
    fontSized: FontSize.s12,
  );

  ///  7 - TEXT STYLE FOR tabBar COLOR 16
  static final TextStyle tabBarStyle = boldFont(
    color: ColorManager.primary,
    fontSized: FontSize.s12,
  );
}
