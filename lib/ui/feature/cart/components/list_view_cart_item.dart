import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nike/ui/feature/home/models/ProductModel.dart';

import 'cart_list_view_items.dart';
import 'clear_and_item_count.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key, required this.cartProducts});
  final List<ProductModel> cartProducts;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ItemCountAndClear(),
          const Gap(10),
          CartListViewItems(cartProducts: cartProducts),
        ],
      ),
    );
  }
}
