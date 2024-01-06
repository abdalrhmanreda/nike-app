import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
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
    int tag = 1;

    return Column(
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
        HorizontalChoiceList(options: ProductCubit.get(context).options),
      ],
    );
  }
}
