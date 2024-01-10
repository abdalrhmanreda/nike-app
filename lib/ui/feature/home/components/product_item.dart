import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nike/config/colors/app_colors.dart';
import 'package:nike/core/constant/app_constant.dart';
import 'package:nike/ui/feature/fav/controllers/fav_cubit.dart';
import 'package:nike/ui/feature/home/controllers/product_cubit.dart';
import 'package:nike/ui/feature/home/models/ProductModel.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: AppConstant.deviceWidth(context) / 2.2,
      height: AppConstant.deviceHeight(context) / 3.3,
      decoration: BoxDecoration(
        color: const Color(AppColors.kWhiteColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () async {
                FavCubit.get(context).addToFav(productModel: productModel);
              },
              icon: true
                  ? const Icon(
                      Iconsax.heart_bold,
                      color: Colors.red,
                    )
                  : const Icon(
                      Iconsax.heart_outline,
                      color: Colors.grey,
                    ),
            ),
          ),
          const Gap(5),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.skewY(0.2),
            child: CachedNetworkImage(
                imageUrl: productModel.image!,
                fit: BoxFit.fill,
                width: AppConstant.deviceWidth(context) / 3,
                height: AppConstant.deviceHeight(context) / 8),
          ),
          Text(
            ProductCubit.get(context).options[0],
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: const Color(AppColors.kPrimaryColor),
                  fontSize: 16.sp,
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              productModel.name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: const Color(AppColors.kPriceColor),
                  ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '\$${productModel.initialPrice!}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: const BoxDecoration(
                    color: Color(AppColors.kPrimaryColor),
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(15)),
                  ),
                  child: const Icon(
                    Iconsax.add_outline,
                    color: Color(AppColors.kWhiteColor),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
