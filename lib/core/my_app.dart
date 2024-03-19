// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'blocks/lang_cubit/lang_cubit.dart';
import 'localization/set_localization.dart';
import 'navigator/named_routes.dart';
import 'navigator/navigator.dart';
import 'navigator/route_generator.dart';
import 'res/theme_manager.dart';
import 'res/values_manager.dart';
import 'utilities/main_data/MainDataImports.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(ScreenSizes.width, ScreenSizes.height),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: MainData.providers(context),
            child: BlocBuilder<LangCubit, LangState>(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: getAppTheme(),
                  title: "Movies",
                  supportedLocales: const [
                    Locale('en', 'US'),
                    Locale('ar', 'EG')
                  ],
                  localizationsDelegates: const [
                    SetLocalization.localizationsDelegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  locale: state.locale,
                  navigatorKey: Go.navigatorKey,
                onGenerateRoute: RouterGenerator.getRoute,
                  initialRoute: NamedRoutes.splash.routeName,
                  scrollBehavior: const MaterialScrollBehavior(
                    androidOverscrollIndicator:
                        AndroidOverscrollIndicator.stretch,
                  ),
                  builder: (ctx, child) {
                    child = FlutterEasyLoading(child: child); //do something
                    return child;
                  },
                );
              },
            ),
          );
        });
  }
}
