import 'package:flutter/material.dart';

import '../res/color_manager.dart';
import '../res/text_style_manager.dart';
import '../res/values_manager.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final Color? textColor;
  final Color? color;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? margin;
  final double? width;
  final double? fontSize;
  final double? height;
  final double? elevation;
  final bool? disabled;
  final String? fontFamily;
  final FontWeight? fontWeight;

  const DefaultButton({
    super.key,
    required this.title,
    this.onTap,
    this.color,
    this.disabled,
    this.textColor,
    this.borderRadius,
    this.margin,
    this.borderColor,
    this.fontFamily,
    this.fontSize,
    this.width,
    this.height,
    this.fontWeight,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    Color border = color ?? ColorManager.primary;
    return IgnorePointer(
      ignoring: disabled ?? false,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? AppSize.sH40,
        margin: margin ??
            EdgeInsets.symmetric(
              horizontal: AppMargin.mW10,
              vertical: AppMargin.mH5,
            ),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? ColorManager.primary,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(AppSize.sH10),
              side: BorderSide(color: borderColor ?? border, width: 1),
            ),
            elevation: elevation ?? 0,
          ),
          child: Text(title,
              style: TextStyleManager.defaultButtonStyle.copyWith(
                color: textColor ?? ColorManager.white,
                fontSize: fontSize ?? AppSize.sH14,
                fontFamily: fontFamily,
                fontWeight: fontWeight,
              )),
        ),
      ),
    );
  }
}
