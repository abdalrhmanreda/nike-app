import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:nike/generated/assets.dart';

class SignWithGoogle extends StatelessWidget {
  const SignWithGoogle({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.iconsGoogle,
          width: 30,
          height: 30,
        ),
        const Gap(10),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
