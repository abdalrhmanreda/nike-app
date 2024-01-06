import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nike/ui/feature/splash_screen/components/on_boarding2/title_and_desc_part.dart';
import 'package:nike/ui/feature/splash_screen/components/on_boarding_item_content/on_boarding_item_content.dart';

import 'on_boarding3/image_part.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key, required this.onBoardingItemContent});
  final OnBoardingItemContent onBoardingItemContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImagePart(onBoardingItemContent: onBoardingItemContent),
        const Gap(25),
        TitleAndDescriptionPart(onBoardingItemContent: onBoardingItemContent),
      ],
    );
  }
}
