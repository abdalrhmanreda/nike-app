import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../../generated/assets.dart';

Stack locationImage(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: AppConstant.deviceWidth(context),
        height: AppConstant.deviceHeight(context) / 5,
        decoration: ShapeDecoration(
          image: const DecorationImage(
            image: AssetImage(
              Assets.detailsMap,
            ),
            fit: BoxFit.fill,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
      const CircleAvatar(
        child: Icon(Iconsax.location_outline),
      ),
    ],
  );
}
