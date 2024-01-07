import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../generated/assets.dart';

class ProfilePhotoPart extends StatelessWidget {
  const ProfilePhotoPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100.w,
          height: 95.h,
          decoration: const ShapeDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.profileAbdalrhmanReda),
              fit: BoxFit.fill,
            ),
            shape: OvalBorder(),
          ),
        ),
        Text(
          'Abdulrahman Reda',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        Text(
          'Change Profile Picture',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: const Color(AppColors.kPrimaryColor),
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
