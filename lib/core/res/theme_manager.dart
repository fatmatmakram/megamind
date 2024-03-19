// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'style_manager.dart';
import 'text_style_manager.dart';
import 'values_manager.dart';

ThemeData getAppTheme() => ThemeData(
      useMaterial3: true,
      errorColor: ColorManager.error,
      // main Colors
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightprimary,
      fontFamily: "URWGeometricArabic",
      primaryColorDark: ColorManager.darkprimary,
      scaffoldBackgroundColor: ColorManager.white,
      disabledColor: ColorManager.border,
      splashColor: ColorManager.lightprimary,
      //ripple effect color
      // card Theme
      cardTheme: CardTheme(
        color: ColorManager.white,
        elevation: AppSize.sH4,
      ),

      //dialog theme
      dialogTheme: DialogTheme(
        backgroundColor: ColorManager.white,
        elevation: AppSize.sH4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.sH10)),
        titleTextStyle: regularFont(
          color: ColorManager.secondry,
          fontSized: FontSize.s14,
        ),
        contentTextStyle: regularFont(
          color: ColorManager.secondry,
          fontSized: FontSize.s12,
        ),
      ),

      //  bottomNavigationBar  theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorManager.primary,
        elevation: AppSize.sH4,
        selectedLabelStyle: regularFont(
          color: ColorManager.white,
          fontSized: FontSize.s12,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(AppPadding.pH8),
        hintStyle: TextStyleManager.hintFieldStyle,
        labelStyle: TextStyleManager.labelFieldStyle,
        errorStyle: TextStyleManager.primaryStyle,
        fillColor: ColorManager.white,
        filled: true,
        // enable border Style
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.sH6),
          borderSide: BorderSide(color: Colors.transparent, width: AppSize.sH1),
        ),
        // focused border Style
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.sH6),
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.sH1),
        ),
        // error border Style
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.sH6),
          borderSide: BorderSide(color: ColorManager.error, width: AppSize.sH1),
        ),
        // focused Error Border Style
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.sH6),
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.sH1),
        ),
      ),
    );
