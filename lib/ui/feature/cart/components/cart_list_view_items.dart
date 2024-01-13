import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nike/config/colors/app_colors.dart';
import 'package:nike/core/components/custom_navigatation.dart';
import 'package:nike/ui/feature/home/models/ProductModel.dart';
import 'package:nike/ui/feature/product_details/screens/product_details.dart';

import '../controller/cart_cubit.dart';
import 'cart_item.dart';

class CartListViewItems extends StatelessWidget {
  const CartListViewItems({
    super.key,
    required this.cartProducts,
  });

  final List<ProductModel> cartProducts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: .2,
          children: [
            const Gap(5),
            SlidableAction(
              flex: 1,
              onPressed: (context) {},
              borderRadius: BorderRadius.circular(8),
              backgroundColor: const Color(AppColors.kPrimaryColor),
              foregroundColor: Colors.white,
              icon: Iconsax.add_outline,
              autoClose: false,
            ),
            const Gap(5),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: .4,
          children: [
            const Gap(5),
            SlidableAction(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              // An action can be bigger than the others.
              flex: 1,
              onPressed: (context) {},
              borderRadius: BorderRadius.circular(8),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.remove,

              autoClose: false,
            ),
            const Gap(8),
            SlidableAction(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              // An action can be bigger than the others.
              flex: 1,
              onPressed: (context) {
                CartCubit.get(context)
                    .removeFromCart(productId: cartProducts[index].id!);
              },
              borderRadius: BorderRadius.circular(8),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: IconlyBroken.delete,

              autoClose: false,
            ),
            const Gap(5),
          ],
        ),
        child: InkWell(
          onTap: () {
            CustomNavigation.navigateTo(
              context,
              ProductDetailsScreen(
                  productModel: cartProducts[index], index: index.toString()),
            );
          },
          child: CartItem(
            cartProducts: cartProducts,
            index: index,
          ),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => const Gap(15),
      itemCount: cartProducts.length,
    );
  }
}
