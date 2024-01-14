import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nike/ui/feature/fav/controllers/fav_cubit.dart';
import 'package:nike/ui/feature/home/models/ProductModel.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/constant/strings.dart';
import 'add_to_cart.dart';

class AddToCartAndFav extends StatelessWidget {
  const AddToCartAndFav({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AddToCart(
          productModel: productModel,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<FavCubit, FavState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return CircleAvatar(
                radius: 25,
                backgroundColor: const Color(AppColors.kLoginWithGoogleColor),
                child: IconButton(
                  onPressed: () async {
                    if (await FavCubit.get(context)
                        .isProductInFavorites(userId!, productModel.id!)) {
                      FavCubit.get(context)
                          .removeFromFav(productId: productModel.id!);
                    } else {
                      FavCubit.get(context)
                          .addToFav(productModel: productModel);
                    }
                  },
                  icon: FavCubit.get(context).favId[productModel.id!] != null
                      ? const Icon(
                          Iconsax.heart_bold,
                          color: Colors.red,
                        )
                      : const Icon(
                          Iconsax.heart_outline,
                          color: Colors.grey,
                        ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
