import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nike/ui/feature/authentication/components/register/full_name.dart';

import '../../../../generated/l10n.dart';
import '../components/profile_image_part.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(15.0),
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
              nameController: nameController,
              title: S.of(context).email,
              hint: ''),
          const Gap(15),
          TitleAndTextFormFeild(
              nameController: nameController,
              title: S.of(context).phone,
              hint: ''),
          const Gap(15),
          TitleAndTextFormFeild(
              nameController: nameController,
              title: S.of(context).location,
              hint: ''),
        ],
      ),
    );
  }
}
