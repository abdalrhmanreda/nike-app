import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'on_boarding_item_content/on_boarding_item_content.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingItemContent onBoardingItemContent;
  final BuildContext context;
  const OnBoardingItem({
    super.key,
    required this.onBoardingItemContent,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      children: [
        SvgPicture.asset(
          onBoardingItemContent.image,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.5,
        ),
        Text(
          onBoardingItemContent.title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 19.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 70,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 35,
          ),
          child: Text(
            onBoardingItemContent.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
          ),
        ),
      ],
    );
  }
}
