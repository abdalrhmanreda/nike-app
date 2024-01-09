import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../config/colors/app_colors.dart';
import 'add_to_cart.dart';

class AddToCartAndFav extends StatelessWidget {
  const AddToCartAndFav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const AddToCart(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: const Color(AppColors.kLoginWithGoogleColor),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.heart_outline,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
