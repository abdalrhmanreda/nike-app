import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../generated/assets.dart';
import '../on_boarding_item_content/on_boarding_item_content.dart';

class ImagesPart extends StatelessWidget {
  const ImagesPart({
    super.key,
    required this.onBoardingItemContent,
  });

  final OnBoardingItemContent onBoardingItemContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Image.asset(Assets.onBoarding2Highlight10),
              ),
              Image.asset(Assets.onBoarding2Misc04),
            ],
          ),
        ),
        SvgPicture.asset(onBoardingItemContent.image),
        Image.asset(Assets.onBoarding2Shadow),
      ],
    );
  }
}
