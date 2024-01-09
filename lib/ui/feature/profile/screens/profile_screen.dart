import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nike/ui/feature/authentication/components/register/full_name.dart';
import 'package:nike/ui/feature/authentication/controller/auth_cubit.dart';
import 'package:nike/ui/feature/authentication/models/user_model.dart';

import '../../../../generated/l10n.dart';
import '../components/profile_image_part.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    var addressController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          UserModel userModel = AuthCubit.get(context).userModel!;
          nameController.text = userModel.name!;
          emailController.text = userModel.email!;
          phoneController.text = userModel.phone!;
          addressController.text = userModel.address ?? 'Egypt';
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
                const Gap(15),
                TitleAndTextFormFeild(
                    nameController: addressController,
                    title: S.of(context).location,
                    hint: ''),
              ],
            ),
          );
        },
      ),
    );
  }
}
