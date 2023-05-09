import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../presentation/screens/movies/movies_screen.dart';
import '../presentation/stars/stars_screen.dart';
import '../presentation/tv_shows/tv_shows_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const MoviesScreen(),
    const TVShowsScreen(),
    const StarsScreen(),
  ];

  List<String> appBarTitles = [
    'Movies',
    'TV Shows',
    'Stars',
  ];

  void changeScreensIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }
}
