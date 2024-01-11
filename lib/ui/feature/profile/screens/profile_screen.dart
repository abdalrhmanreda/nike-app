import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:nike/ui/feature/authentication/components/register/full_name.dart';
import 'package:nike/ui/feature/authentication/controller/auth_cubit.dart';
import 'package:nike/ui/feature/authentication/models/user_model.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../generated/l10n.dart';
import '../components/profile_image_part.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is GetUserDataSuccessState) {
            showDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: const Text('profile updated successfully'),
                content: Lottie.network(
                    'https://lottie.host/b26e87d2-a9b0-45cc-9509-64ae5914876c/jrbmCzA1x8.json'),
                actions: [
                  CupertinoDialogAction(
                      child: const Text('Ok'),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ),
            );
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          UserModel userModel = AuthCubit.get(context).userModel!;
          nameController.text = userModel.name!;
          emailController.text = userModel.email!;
          phoneController.text = userModel.phone!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const ProfilePhotoPart(),
                const Gap(20),
                TitleAndTextFormFeild(
                    nameController: nameController,
                    title: S.of(context).registerFullName,
                    hint: ''),
                const Gap(15),
                TitleAndTextFormFeild(
                    nameController: emailController,
                    title: S.of(context).email,
                    hint: ''),
                const Gap(15),
                TitleAndTextFormFeild(
                    nameController: phoneController,
                    title: S.of(context).phone,
                    hint: ''),
                const Gap(25),
                CustomButton(
                  onPressed: () {
                    if (AuthCubit.get(context).profilePhoto == null) {
                      AuthCubit.get(context).updateUserData(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                      );
                    } else {
                      AuthCubit.get(context).uploadImage(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                      );
                    }
                  },
                  height: 45.h,
                  width: AppConstant.deviceWidth(context),
                  radius: 10,
                  color: AppColors.kPrimaryColor,
                  textColor: AppColors.kWhiteColor,
                  vertical: 0,
                  horizontal: 0,
                  fontSize: 16.sp,
                  text: 'update profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
