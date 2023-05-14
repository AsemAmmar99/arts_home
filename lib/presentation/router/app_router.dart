import 'package:arts_home/data/remote/responses/movies_response.dart';
import 'package:arts_home/data/remote/responses/tv_shows_response.dart';
import 'package:arts_home/presentation/screens/movies/movie_details_screen.dart';
import 'package:arts_home/presentation/screens/tv_shows/tv_shows_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:arts_home/core/screens.dart' as screens;

import '../screens/home/home_layout.dart';
import '../screens/splash/splash_screen.dart';

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings){
    startScreen = const SplashScreen();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.homeLayout:
        return MaterialPageRoute(builder: (_) => const HomeLayout());
        case screens.movieDetailsScreen:
      MoviesResults movieModel = settings.arguments as MoviesResults;
      return MaterialPageRoute(builder: (_) => MovieDetailsScreen(movieModel: movieModel));
      case screens.tvShowsDetailsScreen:
        TvShowsResults tvShowsModel = settings.arguments as TvShowsResults;
        return MaterialPageRoute(builder: (_) => TvShowsDetailsScreen(tvShowsModel: tvShowsModel,));
      default:
        return null;
    }
  }
}