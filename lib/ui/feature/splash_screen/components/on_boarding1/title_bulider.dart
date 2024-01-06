import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike/core/constant/app_constant.dart';

import '../../../../../config/colors/app_colors.dart';
import '../../../../../generated/assets.dart';
import '../on_boarding_item_content/on_boarding_item_content.dart';

class TitleBuilder extends StatelessWidget {
  const TitleBuilder({
    super.key,
    required this.onBoardingItemContent,
  });

  final OnBoardingItemContent onBoardingItemContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: AppConstant.deviceWidth(context) / 2,
          ),
          child: Align(
            child: Image.asset(Assets.onBoarding1TitleTag),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 25,
          ),
          child: Text(
            onBoardingItemContent.title.toUpperCase(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w900,
                  color: const Color(AppColors.kWhiteColor),
                ),
          ),
        ),
      ],
    );
  }
}
