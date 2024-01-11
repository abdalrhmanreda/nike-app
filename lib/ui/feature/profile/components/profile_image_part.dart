import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:nike/ui/feature/authentication/controller/auth_cubit.dart';

import '../../../../config/colors/app_colors.dart';

class ProfilePhotoPart extends StatelessWidget {
  const ProfilePhotoPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            Container(
              width: 100.w,
              height: 95.h,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AuthCubit.get(context).profilePhoto == null
                      ? CachedNetworkImageProvider(
                          AuthCubit.get(context).userModel!.profileImage!)
                      : FileImage(AuthCubit.get(context).profilePhoto!)
                          as ImageProvider<Object>,
                  fit: BoxFit.fill,
                ),
                shape: const OvalBorder(),
              ),
            ),
            const Gap(10),
            Text(
              AuthCubit.get(context).userModel!.name!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            InkWell(
              onTap: () {
                AuthCubit.get(context).getProfileImage();
              },
              child: Text(
                'Change Profile Picture',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: const Color(AppColors.kPrimaryColor),
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
