import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:nike/config/colors/app_colors.dart';
import 'package:nike/core/components/custom_button.dart';
import 'package:nike/core/components/custom_divider.dart';
import 'package:nike/core/constant/app_constant.dart';
import 'package:nike/ui/feature/cart/controller/cart_cubit.dart';

class PricePart extends StatelessWidget {
  const PricePart({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: TextStyle(
                color: const Color(AppColors.kGreyColor),
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '\$${CartCubit.get(context).totalPrice}',
              style: TextStyle(
                color: const Color(AppColors.kGreyColor),
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const Gap(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery',
              style: TextStyle(
                color: const Color(AppColors.kGreyColor),
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '\$${(CartCubit.get(context).totalPrice * 0.02).toStringAsFixed(0)}',
              style: TextStyle(
                color: const Color(AppColors.kGreyColor),
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const Gap(5),
        myDivider(AppConstant.deviceWidth(context), 2),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Cost',
              style: TextStyle(
                color: const Color(AppColors.kGreyColor),
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '\$${CartCubit.get(context).totalPrice * .02 + CartCubit.get(context).totalPrice}',
              style: TextStyle(
                color: const Color(AppColors.kGreyColor),
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const Gap(10),
        CustomButton(
          onPressed: () {
            onPressed();
          },
          height: 47.h,
          width: AppConstant.deviceWidth(context),
          radius: 10,
          color: AppColors.kPrimaryColor,
          textColor: AppColors.kWhiteColor,
          vertical: 0,
          horizontal: 0,
          text: 'Checkout',
        ),
      ],
    );
  }
}
