import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/colors.dart';
import 'default_text.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Size get preferredSize => Size.fromHeight(6.h);

  final String title;

  const DefaultAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: darkRed,
      centerTitle: true,
      elevation: 8,
      title: DefaultText(
        text: title,
        textColor: white,
        weight: FontWeight.bold,
        maxLines: 2,
        textSize: 14.sp,
      ),
    );
  }
}
