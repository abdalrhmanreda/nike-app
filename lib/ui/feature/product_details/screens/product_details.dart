import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nike/config/colors/app_colors.dart';
import 'package:nike/core/components/progress_indector.dart';
import 'package:nike/core/constant/app_constant.dart';
import 'package:nike/generated/assets.dart';
import 'package:nike/ui/feature/home/models/ProductModel.dart';
import 'package:nike/ui/feature/layout/components/app_bar.dart';
import 'package:nike/ui/feature/product_details/controller/product_details_cubit.dart';

import '../../../../generated/l10n.dart';
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
            Navigator.pop(context);
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
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.skewY(0.2),
                        child: CachedNetworkImage(
                          imageUrl: productModel.image!,
                          width: AppConstant.deviceWidth(context) / 1.5,
                        ),
                      ),
                      Image.asset(
                        Assets.detailsEllipse,
                        width: AppConstant.deviceWidth(context),
                      ),
                    ],
                  ),
                  const Gap(25),
                  ShowMoreLikeThis(productModel: productModel),
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
