import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:nike/core/components/custom_app_bar.dart';
import 'package:nike/core/components/custom_text_button.dart';
import 'package:nike/ui/feature/authentication/components/common/container_with_text_from_feild.dart';
import 'package:nike/ui/feature/search/controllers/search_cubit.dart';

import '../../../../core/components/progress_indector.dart';
import '../components/search_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          CustomTextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              text: 'Cancel'),
        ],
        title: 'Search',
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocConsumer<SearchCubit, SearchState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContainerTextFormFeild(
                    isPass: false,
                    controller: searchController,
                    hint: 'Search',
                    onChanged: (value) {
                      SearchCubit.get(context).search(value!);
                    },
                    keyboardType: TextInputType.text,
                    suffixIcon: IconlyBroken.voice,
                    prefixIcon: IconlyBroken.search,
                  ),
                  const Gap(40),
                  Text(
                    'Shoes',
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w700,
                      height: 0.07,
                    ),
                  ),
                  const Gap(20),
                  ConditionalBuilder(
                    condition: state is! LoadingSearchState,
                    builder: (context) => const SearchList(),
                    fallback: (context) => const CustomLoadingIndicator(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
