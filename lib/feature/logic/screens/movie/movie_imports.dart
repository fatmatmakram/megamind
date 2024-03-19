
 import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
 import 'package:megamindd/feature/logic/screens/movie/widgets/build_movie_item.dart';

import '../../../../core/blocks/generic_cubit/generic_cubit.dart';
import '../../../../core/customs/custom_loading.dart';
import '../../../../core/customs/custom_snack_bar.dart';
import '../../../../core/helpers/state.dart';
import '../../../../core/res/color_manager.dart';
import '../../../../core/res/text_style_manager.dart';
import '../../../../core/utilities/utils_functions/network_info.dart';
import '../../logic_resources/logic_repo_imports.dart';
import '../../models/responses_models/movie_model.dart';


part 'movie.dart';
part 'movie_data.dart';
