import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/constant/app_constant.dart';
import '../../home/models/ProductModel.dart';

class NameAndPricePart extends StatelessWidget {
  const NameAndPricePart({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: AppConstant.deviceWidth(context) / 1.4,
          ),
          child: Text(
            '${productModel.name}',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        const Gap(5),
        Text(
          '${productModel.sizing?.toLowerCase()}\'s shoes',
          style: TextStyle(
            color: const Color(AppColors.kGreyColor),
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Gap(5),
        Text(
          '\$${productModel.initialPrice}',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 21.sp,
                fontWeight: FontWeight.w900,
              ),
        ),
      ],
    );
  }
}
