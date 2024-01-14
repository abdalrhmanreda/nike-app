import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nike/config/colors/app_colors.dart';
import 'package:nike/ui/feature/home/models/ProductModel.dart';

import '../../../../core/constant/strings.dart';
import '../../../../generated/l10n.dart';
import '../../cart/controller/cart_cubit.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            if (await CartCubit.get(context)
                .isProductInCart(userId!, productModel.id!)) {
              CartCubit.get(context)
                  .removeFromCart(productId: productModel.id!);
            } else {
              CartCubit.get(context).addToCart(productModel: productModel);
            }
          },
          child: Container(
            alignment: Alignment.center,
            width: 208.w,
            height: 47.h,
            decoration: ShapeDecoration(
              color: const Color(AppColors.kPrimaryColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Iconsax.bag_2_outline,
                  color: Color(AppColors.kWhiteColor),
                  size: 25,
                ),
                const Gap(10),
                Text(
                  S.of(context).addToCart,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 17.sp,
                        color: const Color(AppColors.kWhiteColor),
                      ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
