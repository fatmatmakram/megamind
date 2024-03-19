import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../customs/custom_loading.dart';
import '../res/assets_manager.dart';
import '../res/color_manager.dart';
import '../res/text_style_manager.dart';
import '../res/values_manager.dart';

enum TypeEnum { widget, loading, error, empty, noInterNet, loadingPage , emptyCart }

class StatesList extends StatelessWidget {
  const StatesList({
    Key? key,
    this.msg,
    required this.type,
    this.fontSize,
    this.imgHeight,
    this.listWidget,
    this.onRefresh,
    this.canRefresh = false,
  }) : super(key: key);
  final TypeEnum type;
  final double? fontSize;
  final String? msg;
  final double? imgHeight;
  final Widget? listWidget;
  final Future<void> Function()? onRefresh;
  final bool canRefresh;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case TypeEnum.widget:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Visibility(
            visible: canRefresh,
            replacement: listWidget!,
            child: RefreshIndicator(
                displacement: 50,
                backgroundColor: ColorManager.white,
                strokeWidth: 3,
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                color: ColorManager.primary,
                onRefresh: onRefresh ?? () async {},
                child: listWidget!),
          ),
        );
      case TypeEnum.loading:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomLoading.showLoadingView(),

          ],
        );
      case TypeEnum.loadingPage:
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Lottie.asset(AssetsManager.loading_animation_blue_lottie,
                        height: imgHeight ?? 100.0.h, animate: true, repeat: true),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                child: Text(
                  msg ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyleManager.labelFieldStyle.copyWith(
                    color: ColorManager.black,
                    fontSize: fontSize ?? 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        );

      case TypeEnum.empty:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AssetsManager.emptyCart,
                  height: imgHeight ?? 100.0.h, animate: true, repeat: true),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                child: Text(
                  msg ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyleManager.labelFieldStyle.copyWith(
                    color: ColorManager.black,
                    fontSize: AppSize.sH16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        );
      case TypeEnum.error:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AssetsManager.api_error_lottie,
                height: imgHeight ?? 100.0.h, animate: true, repeat: true),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              child: Text(
                msg ?? '',
                textAlign: TextAlign.center,
                style: TextStyleManager.labelFieldStyle.copyWith(
                  // color: ColorManager.white,
                  fontSize: fontSize ?? 14.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        );
      case TypeEnum.noInterNet:
        return Center(
          child: Lottie.asset(AssetsManager.no_internet_lottie,
              height: imgHeight ?? 100.0.h, animate: true, repeat: true),
        );
      case TypeEnum.emptyCart:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AssetsManager.emptyCart,
                  height: imgHeight ?? 266.0.h, animate: true, repeat: true),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                child: Text(
                  msg ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyleManager.labelFieldStyle.copyWith(
                    color: ColorManager.primary,
                    fontSize: fontSize ?? 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        );
    }
  }
}