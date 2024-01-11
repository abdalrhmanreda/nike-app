import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:nike/config/colors/app_colors.dart';
import 'package:nike/core/components/custom_navigatation.dart';
import 'package:nike/ui/feature/home/models/ProductModel.dart';
import 'package:nike/ui/feature/product_details/controller/product_details_cubit.dart';
import 'package:nike/ui/feature/product_details/screens/product_details.dart';

class ShowMoreLikeThis extends StatelessWidget {
  const ShowMoreLikeThis({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController(
      onAttach: (position) => productModel.id,
    );
    return SizedBox(
      height: 75.h,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            CustomNavigation.navigateTo(
                context,
                ProductDetailsScreen(
                    productModel:
                        ProductDetailsCubit.get(context).moreLikeThis[index],
                    index: index.toString()));
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            width: 90.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                style: BorderStyle.solid,
                color:
                    ProductDetailsCubit.get(context).moreLikeThis[index].id !=
                            productModel.id
                        ? const Color(AppColors.kLoginWithGoogleColor)
                        : const Color(AppColors.kPrimaryColor),
              ),
              color: const Color(AppColors.kWhiteColor),
              boxShadow: const [
                BoxShadow(
                  color: Color(AppColors.kLoginWithGoogleColor),
                  blurStyle: BlurStyle.solid,
                ),
              ],
            ),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.skewY(0.2),
              child: CachedNetworkImage(
                errorWidget: (context, url, error) => CachedNetworkImage(
                    imageUrl:
                        'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEABsbGxscGx4hIR4qLSgtKj04MzM4PV1CR0JHQl2NWGdYWGdYjX2Xe3N7l33gsJycsOD/2c7Z//////////////8BGxsbGxwbHiEhHiotKC0qPTgzMzg9XUJHQkdCXY1YZ1hYZ1iNfZd7c3uXfeCwnJyw4P/Zztn////////////////CABEIANQBGgMBIgACEQEDEQH/xAAYAAEBAQEBAAAAAAAAAAAAAAAAAwECBv/aAAgBAQAAAAD0AAAAAAAAAAAAAAAAAAAAAAAANAAAAADAAAAAAADJAABToAAMkAAFOgAAySoAE8p2GAAySxJTQJ807DAAZJZxw6qJ9p807DA0DmS7mTuhxOuz5p2AwAySxjTY5tZZToAAMksDNyRaWU6AADJLmZPO85LT5p2GAAyS6fLALT5p2GAAyS3MwBafNOwwNA5kuYAbLmnYDADJNAAxToAAMkAAFOgAAcgABugDQAAAABgAAAAADQAAAABgAAAAAAAAAAAAAAAAAH//xAAUAQEAAAAAAAAAAAAAAAAAAAAA/9oACgICEAMQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/8QAIhAAAQMEAwADAQAAAAAAAAAAAQACMRARElEgMkAhMEFw/9oACAEBAAE/AP7A6D4mQfE6D4mQfE6DXFuli3SxbpYt0sW6WLdLFuli3SxbpYt0sW6WLdLFuk6aMg+J0HiTYIuJVymuv9DuxoyD4nQeL/yrZ4h3zV3Y0ZB8ToPFwuKsH7wcfijTcUd2NGQfE6DyIBWI4uNzQGxo7saMg+J0H6chejjYcBATuxoyD4nQeZNkSTRrvwpxueAgJ3Y0ZB8ToPFztLIom5+gQE7saMg+J0Hg5359YgJ3Y0ZB8ToPgd2NGQfE6DW52rnaudq52rnaudq52rnaudq52rnaudq53VkHxOg+JkHx4BYBYBYBYBYBYBYBYBYBYBYBYBYBYBYBYBAW/sX/xAAUEQEAAAAAAAAAAAAAAAAAAABw/9oACAECAQE/AHz/xAAUEQEAAAAAAAAAAAAAAAAAAABw/9oACAEDAQE/AHz/2Q=='),
                imageUrl:
                    ProductDetailsCubit.get(context).moreLikeThis[index].image!,
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const Gap(25),
        itemCount: ProductDetailsCubit.get(context).moreLikeThis.length,
      ),
    );
  }
}
