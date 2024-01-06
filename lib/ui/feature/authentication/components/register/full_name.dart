import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../common/container_with_text_from_feild.dart';

class TitleAndTextFormFeild extends StatelessWidget {
  const TitleAndTextFormFeild({
    super.key,
    required this.nameController,
    required this.title,
    required this.hint,
  });

  final TextEditingController nameController;
  final String title;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodySmall),
        const Gap(10),
        ContainerTextFormFeild(
          isPass: false,
          controller: nameController,
          hint: hint,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
