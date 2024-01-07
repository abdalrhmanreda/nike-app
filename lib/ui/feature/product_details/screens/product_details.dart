import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nike/ui/feature/home/models/ProductModel.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen(
      {super.key, required this.productModel, required this.index});
  final ProductModel productModel;
  final String index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
          tag: index, child: CachedNetworkImage(imageUrl: productModel.image!)),
    );
  }
}
