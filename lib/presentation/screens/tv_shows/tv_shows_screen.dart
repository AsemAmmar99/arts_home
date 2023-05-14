import 'package:arts_home/business_logic/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../views/tv_shows_list_item.dart';

class TvShowsScreen extends StatefulWidget {
  const TvShowsScreen({Key? key}) : super(key: key);

  @override
  State<TvShowsScreen> createState() => _TvShowsScreenState();
}

class _TvShowsScreenState extends State<TvShowsScreen> {
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
                TvShowsListItem(
                  tvShowModel: cubit.tvShowsResponse.results[index],
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
            itemCount: cubit.tvShowsResponse.results.length,
          ),
        );
      },
    );
  }
}
