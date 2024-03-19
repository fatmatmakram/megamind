import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/customs/cached_image.dart';
import '../../../../../core/navigator/named_routes.dart';
import '../../../../../core/navigator/navigator.dart';
import '../../../../../core/res/color_manager.dart';
import '../../../../../core/res/text_style_manager.dart';
import '../../../../../core/res/values_manager.dart';
import '../../../models/responses_models/movie_model.dart';
import '../../movie_details/movie_details_imports.dart';

class BuildMovieItem extends StatelessWidget {
  const BuildMovieItem(this.model, {super.key});

  final MovieModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Go.toNamed(NamedRoutes.movieDetails,
          arguments: MovieDetails(movieId: model.id.toString())),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:AppPadding.pW16,vertical: AppPadding.pH10),
        margin:   EdgeInsets.all(AppMargin.mH5),
        decoration: BoxDecoration(
            color: ColorManager.greyWhite,
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CachedImage(
                  url: '',
                  width: 60.w,
                  height: 60.h,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                Flexible(
                  child: Text(
                    model.title ?? "",
                    textAlign: TextAlign.end,
                    style: TextStyleManager.titlesStyle,
                  ),
                ),
              ],
            ),
            FittedBox(
              child: Text(
                model.body ?? '',
                style: TextStyleManager.tinyStyle
                    .copyWith(color: ColorManager.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
