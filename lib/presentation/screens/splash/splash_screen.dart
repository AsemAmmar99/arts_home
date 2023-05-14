import 'dart:async';

import 'package:arts_home/core/screens.dart' as screens;
import 'package:arts_home/presentation/widgets/default_text.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../styles/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      value: 1,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, -1.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );

    Timer(
      const Duration(milliseconds: 4000),
      () => Navigator.pushNamedAndRemoveUntil(
          context, screens.homeLayout, (route) => false),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [black, darkRed, black],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SlideTransition(
                position: _animation,
                child: Image.asset(
                  'assets/logo.png',
                  height: 30.h,
                  width: 70.w,
                ),
              ),
              DefaultText(
                text: 'ARTS HOME',
                textColor: lightRed,
                textSize: 25.sp,
                weight: FontWeight.bold,
                textStyle: FontStyle.italic,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
