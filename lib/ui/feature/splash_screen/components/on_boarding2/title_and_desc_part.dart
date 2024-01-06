import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../config/colors/app_colors.dart';
import '../../../../../core/constant/app_constant.dart';
import '../../../../../generated/assets.dart';
import '../on_boarding_item_content/on_boarding_item_content.dart';

class TitleAndDescriptionPart extends StatelessWidget {
  const TitleAndDescriptionPart({
    super.key,
    required this.onBoardingItemContent,
  });

  final OnBoardingItemContent onBoardingItemContent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(Assets.onBoarding1Nike),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: AppConstant.deviceWidth(context),
            child: Column(
              children: <Widget>[
                Text(
                  onBoardingItemContent.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w900,
                        color: const Color(AppColors.kWhiteColor),
                      ),
                ),
                const Gap(8),
                Text(
                  onBoardingItemContent.description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 17.sp,
                        color: const Color(AppColors.kOnBoardingDesc),
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
