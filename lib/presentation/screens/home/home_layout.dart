import 'package:arts_home/presentation/styles/colors.dart';
import 'package:arts_home/presentation/widgets/default_app_bar.dart';
import 'package:arts_home/presentation/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/app_cubit.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late AppCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context)..getMovies()..getTvShows()..getStars();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          appBar: DefaultAppBar(title: cubit.appBarTitles[cubit.currentIndex]),
          body: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [black, darkRed, black],
              )),
            ),
            BlocBuilder<AppCubit, AppState>(
              builder: (BuildContext context, state) {
                if (state is AppMoviesLoadingState ||
                    state is AppMoviesLoadingState ||
                    state is AppStarsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(color: white),
                  );
                } else if (state is AppMoviesSuccessState ||
                    state is AppTvShowsSuccessState ||
                    state is AppStarsSuccessState ||
                    state is AppChangeBottomNavBarState) {
                  return cubit.screens[cubit.currentIndex];
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 75.sp,
                        ),
                        DefaultText(
                          text: 'Error Occurred!',
                          textColor: white,
                          textSize: 25.sp,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ]),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedItemColor: white,
            unselectedItemColor: black,
            elevation: 0,
            currentIndex: cubit.currentIndex,
            onTap: (index) => cubit.changeScreensIndex(index),
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.movie_creation_outlined),
                  label: cubit.appBarTitles[0],
                  backgroundColor: darkRed),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.tv),
                  label: cubit.appBarTitles[1],
                  backgroundColor: Colors.red),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.star),
                  label: cubit.appBarTitles[2],
                  backgroundColor: lightRed),
            ],
          ),
        );
      },
    );
  }
}
