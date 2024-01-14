import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nike/config/colors/app_colors.dart';
import 'package:nike/config/routes/routes_path.dart';
import 'package:nike/core/components/custom_navigatation.dart';
import 'package:nike/core/components/progress_indector.dart';
import 'package:nike/ui/feature/home/models/ProductModel.dart';
import 'package:nike/ui/feature/layout/components/app_bar.dart';
import 'package:nike/ui/feature/product_details/components/images_part.dart';
import 'package:nike/ui/feature/product_details/controller/product_details_cubit.dart';
import 'package:readmore/readmore.dart';

import '../../../../generated/l10n.dart';
import '../components/add_to_cart_and_fav.dart';
import '../components/name_and_price_part.dart';
import '../components/show_more_like_this.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen(
      {super.key, required this.productModel, required this.index});

  final ProductModel productModel;
  final String index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppColors.kWhiteColor),
      appBar: LayoutAppBar(
        color: AppColors.kWhiteColor,
        title: S.of(context).sneakerShop,
        leading: IconButton(
          onPressed: () {
            CustomNavigation.navigateByNamedTo(context, RoutePath.layout);
          },
          icon: const Icon(
            Iconsax.arrow_left_2_outline,
            color: Color(AppColors.kPrimaryColor),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: const Color(AppColors.kWhiteColor),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.bag_2_outline,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ConditionalBuilder(
            builder: (context) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  NameAndPricePart(productModel: productModel),
                  const Gap(30),
                  ImagesPartDetails(productModel: productModel),
                  const Gap(25),
                  ShowMoreLikeThis(productModel: productModel),
                  const Gap(15),
                  Expanded(
                    flex: 6,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: ReadMoreText(
                        productModel.description!,
                        trimLines: 4,
                        colorClickableText:
                            const Color(AppColors.kPrimaryColor),
                        trimMode: TrimMode.Line,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(AppColors.kGreyColor),
                        ),
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        lessStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(AppColors.kPrimaryColor),
                        ),
                        moreStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(AppColors.kPrimaryColor),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  AddToCartAndFav(
                    productModel: productModel,
                  )
                ],
              ),
            ),
            condition: state is! LoadingState &&
                ProductDetailsCubit.get(context).moreLikeThis.isNotEmpty,
            fallback: (context) => const CustomLoadingIndicator(),
          );
        },
      ),
    );
  }
}
