import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/app_constant.dart';
import '../../../../../generated/assets.dart';

class BodyOnBoarding1 extends StatelessWidget {
  const BodyOnBoarding1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(Assets.onBoarding1Ss),
        Image.asset(Assets.onBoarding1Nike),
        Align(
          alignment: FractionalOffset.centerRight,
          child: SvgPicture.asset(
            Assets.onBoarding1OnBoarding3,
            height: AppConstant.deviceHeight(context) / 1.8,
          ),
        ),
      ],
    );
  }
}
