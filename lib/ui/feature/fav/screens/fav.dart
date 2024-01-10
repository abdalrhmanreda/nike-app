import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike/core/components/progress_indector.dart';
import 'package:nike/ui/feature/fav/controllers/fav_cubit.dart';
import 'package:nike/ui/feature/home/components/product_grid_view.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(builder: (context, state) {
      if (FavCubit.get(context).favProducts.isNotEmpty) {
        return SingleChildScrollView(
            child:
                ProductsGridView(products: FavCubit.get(context).favProducts));
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
