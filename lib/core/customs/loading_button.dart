import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../res/color_manager.dart';
import '../res/font_manager.dart';
import '../res/text_style_manager.dart';
import '../res/values_manager.dart';
import 'custom_button_animated.dart';

class LoadingButton extends StatelessWidget {
  final GlobalKey<CustomButtonState> btnKey;
  final String title;
  final Function() onTap;
  final Color? textColor;
  final Color? color;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;

  const LoadingButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    this.textColor,
    this.borderRadius,
    this.margin,
    this.borderColor,
    this.fontFamily,
    this.fontSize,
    this.width,
    this.height,
    this.fontWeight,
    required this.btnKey,
  });

  @override
  Widget build(BuildContext context) {
    Color border = color ?? ColorManager.primary;
    return Container(
      margin: margin ??
          EdgeInsets.symmetric(
            horizontal: AppMargin.mW10,
            vertical: AppMargin.mH10,
          ),
      child: Column(
        children: [
          CustomButtonAnimation(
            key: btnKey,
            onTap: onTap,
            width: width ?? MediaQuery.of(context).size.width,
            minWidth: AppSize.sW50,
            height: height ?? AppSize.sH40,
            color: color ?? ColorManager.primary,
            borderRadius: borderRadius ?? AppSize.sH5,
            borderSide: BorderSide(color: borderColor ?? border, width: 1),
            loader: Container(
              padding: EdgeInsets.all(AppPadding.pH10),
              child: SpinKitFoldingCube(
                color: Colors.white,
                size: AppSize.sH20,
              ),
            ),
            child: Text(
              title,
              style: TextStyleManager.loadingButtonStyle.copyWith(
                fontSize: fontSize ?? FontSize.s12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
