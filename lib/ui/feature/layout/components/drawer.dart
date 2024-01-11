import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:nike/config/colors/app_colors.dart';
import 'package:nike/config/routes/routes_path.dart';
import 'package:nike/core/components/custom_divider.dart';
import 'package:nike/core/components/custom_list_tile.dart';
import 'package:nike/core/components/custom_navigatation.dart';
import 'package:nike/core/constant/app_constant.dart';
import 'package:nike/generated/assets.dart';
import 'package:nike/ui/feature/cart/screens/cart.dart';
import 'package:nike/ui/feature/fav/screens/fav.dart';
import 'package:nike/ui/feature/profile/screens/profile_screen.dart';

import '../../../../generated/l10n.dart';
import '../../authentication/controller/auth_cubit.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          CustomNavigation.navigateAndFinish(context, RoutePath.login);
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(AppColors.kPrimaryColor),
          ),
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 40.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(Assets.profileAbdalrhmanReda),
                ),
                const Gap(15),
                Text(
                  'Abdulrahman Reda',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 20.sp,
                        color: const Color(AppColors.kWhiteColor),
                      ),
                ),
                const Gap(45),
                CustomListTile(
                    onTap: () {
                      CustomNavigation.navigateTo(
                          context, const ProfileScreen());
                    },
                    leadingIcon: IconlyBroken.profile,
                    title: S.of(context).profile),
                CustomListTile(
                    onTap: () {
                      CustomNavigation.navigateTo(context, const CartScreen());
                    },
                    leadingIcon: IconlyBroken.bag2,
                    title: S.of(context).cart),
                CustomListTile(
                    onTap: () {
                      CustomNavigation.navigateTo(context, const FavScreen());
                    },
                    leadingIcon: IconlyBroken.heart,
                    title: S.of(context).favorite),
                CustomListTile(
                    onTap: () {},
                    leadingIcon: IconlyBroken.setting,
                    title: S.of(context).settings),
                CustomListTile(
                    onTap: () {},
                    leadingIcon: IconlyBroken.profile,
                    title: S.of(context).profile),
                const Gap(25),
                myDivider(AppConstant.deviceWidth(context) / 1.8, 1),
                CustomListTile(
                    onTap: () {
                      AuthCubit.get(context).logout();
                    },
                    leadingIcon: IconlyBroken.logout,
                    title: S.of(context).signOut),
              ],
            ),
          ),
        );
      },
    );
  }
}
