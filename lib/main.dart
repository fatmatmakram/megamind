 import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/blocks/lang_cubit/lang_cubit.dart';
 import 'core/cache_helper/hive.dart';
import 'core/customs/exeption_view.dart';
import 'core/my_app.dart';
import 'core/navigator/Constants/imports_constants.dart';
import 'core/navigator/Transition/implementation/fade/Option/fade_animation_option.dart';
import 'core/navigator/page_router/Implementation/imports_page_router.dart';
import 'core/navigator/page_router/imports_page_router_builder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initialiseHive();

  WidgetsFlutterBinding.ensureInitialized();

   if (kReleaseMode) {
    ErrorWidget.builder =
        (FlutterErrorDetails details) => const ExceptionView();
  }
  PageRouterBuilder().initAppRouter(
    config: PlatformConfig(
      android: CustomPageRouterCreator(
        parentTransition: TransitionType.fade,
        parentOptions: const FadeAnimationOptions(
          duration: Duration(milliseconds: 300),
        ),
      ),

    ),
  );

  runApp(
    BlocProvider(
      create: (BuildContext context) => LangCubit(),
      child: const MyApp(),
    ),
  );
}


