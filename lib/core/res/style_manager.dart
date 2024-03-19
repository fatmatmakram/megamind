import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
  double fontSized,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
    fontFamily: FontManager.fontFamily,
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSized,
  );
}

// regularFont
TextStyle regularFont({
  required double fontSized,
  required Color color,
}) =>
    _getTextStyle(
      fontSized,
      FontWeightManager.regular,
      color,
    );

// MediumFont
TextStyle mediumFont({
  required double fontSized,
  required Color color,
}) =>
    _getTextStyle(
      fontSized,
      FontWeightManager.medium,
      color,
    );

// boldFont
TextStyle boldFont({
  required double fontSized,
  required Color color,
}) =>
    _getTextStyle(
      fontSized,
      FontWeightManager.bold,
      color,
    );

// lightFont
TextStyle lightFont({
  required double fontSized,
  required Color color,
}) =>
    _getTextStyle(
      fontSized,
      FontWeightManager.light,
      color,
    );
