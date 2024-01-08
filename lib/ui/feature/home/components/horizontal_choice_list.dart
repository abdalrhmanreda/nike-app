import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:nike/config/colors/app_colors.dart';
import 'package:nike/ui/feature/home/components/product_grid_view.dart';
import 'package:nike/ui/feature/home/controllers/product_cubit.dart';

import '../../../../core/components/progress_indector.dart';
import '../../../../core/constant/app_constant.dart';

class HorizontalChoiceList extends StatefulWidget {
  final List<String> options;

  const HorizontalChoiceList({
    Key? key,
    required this.options,
  }) : super(key: key);

  @override
  _HorizontalChoiceListState createState() => _HorizontalChoiceListState();
}

class _HorizontalChoiceListState extends State<HorizontalChoiceList> {
  int selectedOptionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Column(children: [
          SizedBox(
            height: 35.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: widget.options
                  .asMap()
                  .entries
                  .map(
                    (entry) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedOptionIndex = entry.key;
                        });
                        if (entry.key != 0) {
                          ProductCubit.get(context)
                              .getSpecificProducts(brand: entry.value);
                        } else {
                          ProductCubit.get(context).getAllData();
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 5.w),
                        height: 40.h,
                        width: 100,
                        decoration: BoxDecoration(
                          color: selectedOptionIndex == entry.key
                              ? const Color(AppColors.kSplashColor)
                              : Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          entry.value,
                          style: TextStyle(
                            color: selectedOptionIndex == entry.key
                                ? Colors.white
                                : Colors.black,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          state is LoadingState || ProductCubit.get(context).products.isEmpty
              ? Padding(
                  padding: EdgeInsets.only(
                    top: AppConstant.deviceHeight(context) / 3,
                  ),
                  child: const CustomLoadingIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${ProductCubit.get(context).options[selectedOptionIndex]} Shoes",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    ProductsGridView(
                        products: selectedOptionIndex == 0
                            ? ProductCubit.get(context).products
                            : ProductCubit.get(context).specificProducts),
                  ],
                )
        ]);
      },
    );
  }
}
