import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../localization/localization_methods.dart';
import '../res/assets_manager.dart';
import '../res/color_manager.dart';
import '../res/font_manager.dart';
import '../res/values_manager.dart';
import 'default_button.dart';

class ExceptionView extends StatelessWidget {
  const ExceptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AssetsManager.error,
            width: MediaQuery.of(context).size.width * .7,
            height: MediaQuery.of(context).size.height * .3,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: AppMargin.mH20),
            child: Center(
              child: Text(
                tr(context, "expetion"),
                style: TextStyle(
                    fontSize: FontSize.s14, color: ColorManager.primary),
              ),
            ),
          ),
          DefaultButton(
            onTap: () {},
            title: tr(context, "contact_us"),
            fontSize: 12,
            textColor: ColorManager.white,
            width: MediaQuery.of(context).size.width * .45,
          ),
        ],
      ),
    );
  }
}
