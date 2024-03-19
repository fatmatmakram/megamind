import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 import '../blocks/auth_cubit/auth_cubit.dart';
import '../blocks/lang_cubit/lang_cubit.dart';

extension InheritedContext<T> on BuildContext {
  //mediaQuery
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  //auth
  bool get isAuth => read<AuthCubit>().state.authorized;


  String get lang => read<LangCubit>().state.locale.languageCode;
}
