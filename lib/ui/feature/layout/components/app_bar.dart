import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nike/ui/cubit/app_cubit.dart';

import '../../../../config/colors/app_colors.dart';

class LayoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LayoutAppBar({
    super.key,
    required this.advancedDrawerController,
  });
  final AdvancedDrawerController advancedDrawerController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      centerTitle: true,
      title: Text(
        AppCubit.get(context).titles[AppCubit.get(context).currentIndex],
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w500,
            ),
      ),
      leading: IconButton(
        icon: const Icon(Iconsax.textalign_left_outline),
        onPressed: () {
          advancedDrawerController.showDrawer();
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: const Color(AppColors.kWhiteColor),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.bag_2_outline,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
