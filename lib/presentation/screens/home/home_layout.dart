import 'package:arts_home/presentation/styles/colors.dart';
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
    cubit = AppCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            backgroundColor: darkRed,
            centerTitle: true,
            elevation: 8,
            title: DefaultText(
              text: cubit.appBarTitles[cubit.currentIndex],
              textColor: white,
              weight: FontWeight.bold,
              textSize: 20.sp,
            ),
          ),
          body: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [black, darkRed, black],
              )),
            ),
            // BlocBuilder<AppCubit, AppState>(
            //   builder: (BuildContext context, state) {
            //     if (state is AppGetContactsLoadingState) {
            //       return const Center(
            //         child: CircularProgressIndicator(color: darkBlue),
            //       );
            //     } else {
            //       return
                    cubit.screens[cubit.currentIndex],
            //     }
            //   },
            // ),
          ]
          ),
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
                backgroundColor: darkRed
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.tv),
                label: cubit.appBarTitles[1],
                backgroundColor: Colors.red
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.star),
                label: cubit.appBarTitles[1],
                backgroundColor: lightRed
              ),
            ],
          ),
        );
      },
    );
  }
}
