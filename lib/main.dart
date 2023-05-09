import 'package:arts_home/business_logic/app_cubit.dart';
import 'package:arts_home/core/my_bloc_observer.dart';
import 'package:arts_home/data/remote/data_providers/my_dio.dart';
import 'package:arts_home/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  MyDio.dioInit();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return BlocProvider(
          create: (context) => AppCubit()..getMovies(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Arts Home',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            onGenerateRoute: appRouter.onGenerateRoute,
          ),
        );
      },
    );
  }
}
