import 'package:flutter/material.dart';
import 'package:nike/ui/feature/splash_screen/components/on_boarding_item_content/on_boarding_item_content.dart';

import 'on_boarding2/image_part.dart';
import 'on_boarding2/title_and_desc_part.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key, required this.onBoardingItemContent});
  final OnBoardingItemContent onBoardingItemContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ImagesPart(onBoardingItemContent: onBoardingItemContent),
        TitleAndDescriptionPart(onBoardingItemContent: onBoardingItemContent),
      ],
    );
  }
}
