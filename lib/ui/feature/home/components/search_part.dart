import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/routes/routes_path.dart';
import '../../../../core/components/custom_navigatation.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../generated/l10n.dart';

class SearchPart extends StatelessWidget {
  const SearchPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: AppConstant.deviceWidth(context) / 1.3,
          height: 45.h,
          decoration: BoxDecoration(
            color: const Color(AppColors.kWhiteColor),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color(AppColors.kLoginWithGoogleColor),
                blurRadius: 10,
              )
            ],
          ),
          child: TextFormField(
            enabled: false,
            onTap: () {
              CustomNavigation.navigateAndFinish(
                  context, RoutePath.searchScreen);
            },
            decoration: InputDecoration(
              helperStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 15.sp,
                  ),
              hintText: S.of(context).lookingFor,
              prefixIcon: const Icon(IconlyBroken.search),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              border: InputBorder.none,
            ),
          ),
        ),
        const Icon(
          IconlyBroken.filter,
          size: 28,
        ),
      ],
    );
  }
}
