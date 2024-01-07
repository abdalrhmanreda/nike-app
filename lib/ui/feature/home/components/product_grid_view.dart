import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike/core/components/custom_navigatation.dart';
import 'package:nike/ui/feature/home/components/product_item.dart';
import 'package:nike/ui/feature/product_details/screens/product_details.dart';

import '../controllers/product_cubit.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    Key? key, // Fix the typo here
  }) : super(key: key);

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
          itemBuilder: (BuildContext context, int index) => Hero(
            tag: index.toString(),
            child: InkWell(
              onTap: () {
                CustomNavigation.navigateTo(
                  context,
                  ProductDetailsScreen(
                    productModel: ProductCubit.get(context).products[index],
                    index: '$index',
                  ),
                );
              },
              child: ProductItem(
                productModel: ProductCubit.get(context).products[index],
              ),
            ),
          ),
          itemCount: ProductCubit.get(context).products.length,
        );
      },
    );
  }
}
