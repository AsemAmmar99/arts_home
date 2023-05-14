part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppChangeBottomNavBarState extends AppState {}

class AppMoviesSuccessState extends AppState {}

class AppMoviesLoadingState extends AppState {}

class AppMoviesErrorState extends AppState {}

class AppTvShowsSuccessState extends AppState {}

class AppTvShowsLoadingState extends AppState {}

class AppTvShowsErrorState extends AppState {}

class AppStarsSuccessState extends AppState {}

class AppStarsLoadingState extends AppState {}

class AppStarsErrorState extends AppState {}