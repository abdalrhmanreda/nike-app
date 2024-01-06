import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';
import '../on_boarding_item_content/on_boarding_item_content.dart';

class ImagePart extends StatelessWidget {
  const ImagePart({
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
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(Assets.onBoarding3Vector),
            Image.asset(onBoardingItemContent.image),
          ],
        ),
      ],
    );
  }
}
