import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:nike/core/components/custom_navigatation.dart';
import 'package:nike/ui/feature/product_details/screens/product_details.dart';
import 'package:nike/ui/feature/search/controllers/search_cubit.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/constant/app_constant.dart';

class SearchList extends StatelessWidget {
  const SearchList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: SearchCubit.get(context).searchList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            CustomNavigation.navigateTo(
                context,
                ProductDetailsScreen(
                    productModel: SearchCubit.get(context).searchList[index],
                    index: index.toString()));
          },
          child: Container(
            width: AppConstant.deviceWidth(context),
            height: 95.h,
            padding: EdgeInsets.only(
              left: 8.w,
            ),
            decoration: ShapeDecoration(
              color: const Color(AppColors.kWhiteColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CachedNetworkImage(
                  imageUrl: SearchCubit.get(context).searchList[index].image!,
                  fit: BoxFit.fill,
                  width: AppConstant.deviceWidth(context) / 4,
                  height: 85.h,
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: AppConstant.deviceWidth(context) / 1.9,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${SearchCubit.get(context).searchList[index].name}',
                        style: TextStyle(
                          color: const Color(AppColors.kBlackColor),
                          fontSize: 16.sp,
                          height: 1.2,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 3,
                      ),
                      const Gap(5),
                      Text(
                        '\$${SearchCubit.get(context).searchList[index].initialPrice}',
                        style: TextStyle(
                          color: const Color(AppColors.kPrimaryColor),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Gap(20),
    );
  }
}
