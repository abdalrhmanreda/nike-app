import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nike/core/components/progress_indector.dart';
import 'package:nike/generated/assets.dart';
import 'package:nike/ui/feature/fav/controllers/fav_cubit.dart';
import 'package:nike/ui/feature/home/components/product_grid_view.dart';

import '../../home/models/ProductModel.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ProductModel>>(
      stream: FavCubit.get(context).favStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomLoadingIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final favCubit = FavCubit.get(context);

          if (favCubit.favProducts.isNotEmpty) {
            return SingleChildScrollView(
              child: ProductsGridView(products: favCubit.favProducts),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.emptyEmpty),
                const Gap(10),
                Text('Nothing here yet',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            );
          }
        }
      },
    );
  }
}

// }
