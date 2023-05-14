import 'package:arts_home/business_logic/app_cubit.dart';
import 'package:arts_home/presentation/views/movies_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
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
        return Padding(
          padding: EdgeInsets.all(10.sp),
          child: ListView.separated(
            itemBuilder: (context, index) =>
                MoviesListItem(
                  movieModel: cubit.moviesResponse.results[index],
                ),
            separatorBuilder: (context, index) =>
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        height: 1.h,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
            itemCount: cubit.moviesResponse.results.length,
          ),
        );
      },
    );
  }
}
