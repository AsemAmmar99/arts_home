import 'package:arts_home/business_logic/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../views/stars_list_item.dart';

class StarsScreen extends StatefulWidget {
  const StarsScreen({Key? key}) : super(key: key);

  @override
  State<StarsScreen> createState() => _StarsScreenState();
}

class _StarsScreenState extends State<StarsScreen> {
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
                StarsListItem(
                  starsModel: cubit.starsResponse.results[index],
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
            itemCount: cubit.starsResponse.results.length,
          ),
        );
      },
    );
  }
}