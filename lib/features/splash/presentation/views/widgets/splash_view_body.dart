import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          Expanded(
            flex: 4,
            child: Image.asset(
              "assets/images/splash_icon.png",
              width: double.infinity,
            ),
          ),
          const Spacer(flex: 1),
      AnimatedTextKit(
      repeatForever: true,
      pause: const Duration(seconds: 1),
      animatedTexts: [
        TyperAnimatedText(
          'EgyTour App',
          textStyle: Styles.textStyle900.copyWith(
            fontSize: 30.sp,
            color: Theme.of(context).primaryColor,
          ),
          speed: const Duration(milliseconds: 500), // Adjust typing speed
        ),
      ],
    ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
