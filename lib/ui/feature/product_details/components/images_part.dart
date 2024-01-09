import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../../generated/assets.dart';
import '../../home/models/ProductModel.dart';

class ImagesPartDetails extends StatelessWidget {
  const ImagesPartDetails({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.skewY(0.2),
          child: CachedNetworkImage(
            imageUrl: productModel.image!,
            width: AppConstant.deviceWidth(context) / 1.5,
          ),
        ),
        Image.asset(
          Assets.detailsEllipse,
          width: AppConstant.deviceWidth(context),
        ),
      ],
    );
  }
}
