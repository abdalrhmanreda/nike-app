import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:nike/core/components/progress_indector.dart';
import 'package:nike/core/constant/app_constant.dart';
import 'package:nike/ui/feature/home/components/product_grid_view.dart';
import 'package:nike/ui/feature/home/controllers/product_cubit.dart';

import '../../../../generated/l10n.dart';
import '../components/horizontal_choice_list.dart';
import '../components/search_part.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return state is LoadingState
              ? Padding(
                  padding: EdgeInsets.only(
                    top: AppConstant.deviceHeight(context) / 2.5,
                  ),
                  child: const CustomLoadingIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SearchPart(),
                    const Gap(15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        S.of(context).selectCategory,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    HorizontalChoiceList(
                        options: ProductCubit.get(context).options),
                    const Gap(15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        S.of(context).popularShoes,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    const ProductsGridView(),
                  ],
                );
        },
      ),
    );
  }
}
