import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:nike/config/colors/app_colors.dart';
import 'package:nike/core/constant/app_constant.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartProducts,
    required this.index,
  });

  final List cartProducts;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstant.deviceWidth(context),
      height: 95.h,
      padding: EdgeInsets.only(
        left: 8.w,
      ),
      decoration: ShapeDecoration(
        color: const Color(AppColors.kWhiteColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CachedNetworkImage(
            imageUrl: cartProducts[index].image!,
            fit: BoxFit.fill,
            width: AppConstant.deviceWidth(context) / 4,
            height: 85.h,
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: AppConstant.deviceWidth(context) / 2,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${cartProducts[index].name}',
                  style: TextStyle(
                    color: const Color(AppColors.kBlackColor),
                    fontSize: 16.sp,
                    height: 1.2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(5),
                Text(
                  '\$${cartProducts[index].initialPrice}',
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
    );
  }
}
