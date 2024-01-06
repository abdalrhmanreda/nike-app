import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike/config/colors/app_colors.dart';
import 'package:nike/ui/cubit/app_cubit.dart';

import '../components/app_bar.dart';
import '../components/drawer.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final advancedDrawerController = AdvancedDrawerController();

    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(AppColors.kPrimaryColor),
        ),
      ),
      controller: advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 500),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: const CustomDrawer(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return Scaffold(
            appBar: LayoutAppBar(
              advancedDrawerController: advancedDrawerController,
            ),
            body: AppCubit.get(context)
                .screens[AppCubit.get(context).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: AppCubit.get(context).items,
              currentIndex: AppCubit.get(context).currentIndex,
              onTap: (index) {
                AppCubit.get(context).chageBottomNavBar(index);
              },
            ),
          );
        },
      ),
    );
  }
}
