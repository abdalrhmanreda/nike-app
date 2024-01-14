import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import BlocBuilder
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import 'package:nike/core/components/custom_app_bar.dart';
import 'package:nike/ui/feature/cart/components/list_view_cart_item.dart';
import 'package:nike/ui/feature/cart/controller/cart_cubit.dart';

import '../../../../config/routes/routes_path.dart';
import '../../../../core/components/custom_navigatation.dart';
import '../../../../generated/assets.dart';
import '../components/price_part.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Cart',
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(IconlyBroken.arrowLeft2)),
      ),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is RemoveFromCartState) {
            setState(() {});
          }
        },
        builder: (context, cartProducts) {
          if (CartCubit.get(context).cartProducts.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CartListView(
                      cartProducts: CartCubit.get(context).cartProducts,
                    ),
                  ),
                  const Gap(25),
                  PricePart(
                    onPressed: () {
                      CustomNavigation.navigateByNamedTo(
                          context, RoutePath.checkoutScreen);
                    },
                  ),
                ],
              ),
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
        },
      ),
    );
  }
}
