import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nike/core/components/progress_indector.dart';
import 'package:nike/generated/assets.dart';
import 'package:nike/ui/feature/fav/controllers/fav_cubit.dart';
import 'package:nike/ui/feature/home/components/product_grid_view.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        if (FavCubit.get(context).favProducts.isNotEmpty) {
          return SingleChildScrollView(
              child: ProductsGridView(
                  products: FavCubit.get(context).favProducts));
        } else if (FavCubit.get(context).favProducts.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.emptyEmpty),
              const Gap(10),
              Text('Nothing here yet',
                  style: Theme.of(context).textTheme.titleLarge),
            ],
          );
        } else if (state is FavLoading) {
          return const CustomLoadingIndicator();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
