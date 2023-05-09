part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppChangeBottomNavBarState extends AppState {}

class AppMoviesSuccessState extends AppState {}

class AppMoviesLoadingState extends AppState {}

class AppMoviesErrorState extends AppState {}