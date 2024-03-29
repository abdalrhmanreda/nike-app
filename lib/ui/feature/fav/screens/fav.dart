import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import BlocBuilder
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nike/config/colors/app_colors.dart';
import 'package:nike/generated/assets.dart';
import 'package:nike/ui/feature/fav/controllers/fav_cubit.dart';
import 'package:nike/ui/feature/home/components/product_grid_view.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, favProducts) {
        if (FavCubit.get(context).favProducts.isNotEmpty) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    FavCubit.get(context).clearFav();
                  },
                  icon: const Icon(
                    Iconsax.trash_outline,
                    color: Color(AppColors.kGreyColor),
                  ),
                ),
                ProductsGridView(products: FavCubit.get(context).favProducts),
              ],
            ),
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.emptyEmpty),
              const Gap(10),
              Text(
                'Nothing here yet',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          );
        }
      },
    );
  }
}
