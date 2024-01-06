import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike/core/constant/app_constant.dart';

import '../../../../../generated/assets.dart';

class TitleTagBuilder extends StatelessWidget {
  const TitleTagBuilder({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: AppConstant.deviceWidth(context) / 4,
          ),
          child: Align(
            child: Image.asset(
              Assets.onBoarding1TitleTag,
              color: Colors.black,
              height: 12.h,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(),
          ),
        ),
      ],
    );
  }
}
