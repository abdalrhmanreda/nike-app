import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike/core/components/custom_navigatation.dart';
import 'package:nike/ui/feature/home/components/product_item.dart';
import 'package:nike/ui/feature/product_details/controller/product_details_cubit.dart';
import 'package:nike/ui/feature/product_details/screens/product_details.dart';

import '../controllers/product_cubit.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    Key? key,
    required this.products, // Fix the typo here
  }) : super(key: key);
  final List products;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return GridView.builder(
          padding: EdgeInsets.all(5.r),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (BuildContext context, int index) => InkWell(
            onTap: () {
              CustomNavigation.navigateTo(
                context,
                ProductDetailsScreen(
                  productModel: products[index],
                  index: '$index',
                ),
              );
              ProductDetailsCubit.get(context)
                  .getMoreLikeThis(brand: products[index].brand!.name!);
            },
            child: ProductItem(
              productModel: products[index],
            ),
          ),
          itemCount: products.length,
        );
      },
    );
  }
}
