import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike/config/colors/app_colors.dart';
import 'package:nike/core/constant/app_constant.dart';
import 'package:nike/generated/assets.dart';

import '../../../../generated/l10n.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoaded = false;
  bool textLoaded = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoaded = true;
      });
    });
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        textLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppColors.kSplashColor),
      body: SizedBox(
        height: AppConstant.deviceHeight(context),
        width: AppConstant.deviceWidth(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: isLoaded,
                child: Opacity(
                  opacity: isLoaded ? 1.0 : 0.0,
                  child: Image.asset(
                    Assets.logoLogo,
                    color: const Color(AppColors.kWhiteColor),
                    width: isLoaded ? 150 : 0.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: 40.sp,
                  color: Colors.white,
                  shadows: const [
                    Shadow(
                      blurRadius: 7.0,
                      color: Colors.white,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    FlickerAnimatedText(S.of(context).appName.toUpperCase()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
