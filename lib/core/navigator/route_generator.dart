import 'package:flutter/material.dart';

import '../../feature/logic/screens/movie/movie_imports.dart';
import '../../feature/logic/screens/movie_details/movie_details_imports.dart';
import '../../feature/logic/screens/splash/splash_imports.dart';
import 'named_routes.dart';
import 'page_router/imports_page_router_builder.dart';

class RouterGenerator {
  RouterGenerator._();

  static final PageRouterBuilder _pageRouter = PageRouterBuilder();

  static Route<dynamic> getRoute(RouteSettings settings) {
    final namedRoute =
        NamedRoutes.values.firstWhere((e) => e.routeName == settings.name);
    switch (namedRoute) {
      case NamedRoutes.splash:
        return _pageRouter.build(
          const SplashView(),
          settings: settings,
        );

      case NamedRoutes.movie:
        return _pageRouter.build(
          const Movies(),
          settings: settings,
        );
      case NamedRoutes.movieDetails:
        final args = settings.arguments as MovieDetails;
        return _pageRouter.build(
          MovieDetails(movieId: args.movieId),
          settings: settings,
        );
    }
  }

  static Route<dynamic> undefineRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('No route exists here ! '),
        ),
      ),
    );
  }
}
