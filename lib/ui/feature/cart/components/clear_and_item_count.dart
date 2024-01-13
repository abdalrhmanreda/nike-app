import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../config/colors/app_colors.dart';
import '../controller/cart_cubit.dart';

class ItemCountAndClear extends StatelessWidget {
  const ItemCountAndClear({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${CartCubit.get(context).cartProducts.length} Items',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        IconButton(
          onPressed: () => CartCubit.get(context).clearCart(),
          icon: const Icon(
            Iconsax.trash_outline,
            color: Color(AppColors.kGreyColor),
          ),
        ),
      ],
    );
  }
}
