import 'package:arts_home/business_logic/app_cubit.dart';
import 'package:arts_home/presentation/styles/colors.dart';
import 'package:arts_home/presentation/widgets/default_network_image.dart';
import 'package:arts_home/presentation/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../data/remote/responses/stars_response.dart';

class StarsListItem extends StatelessWidget {
  final StarsResults starsModel;

  const StarsListItem({Key? key, required this.starsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: DefaultText(
              text: starsModel.name,
              textSize: 18.sp,
              weight: FontWeight.bold,
              textColor: lightRed,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: 2.h, bottom: 1.h),
              child: DefaultNetworkImage(
                imageURL: AppCubit.get(context)
                    .imageURL(imagePath: starsModel.profilePath),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: DefaultText(
                  text: starsModel.knownForDepartment,
                  textSize: 14.sp,
                  weight: FontWeight.bold,
                  textColor: white,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
