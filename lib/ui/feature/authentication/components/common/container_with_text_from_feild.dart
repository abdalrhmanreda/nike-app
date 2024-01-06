import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/colors/app_colors.dart';
import '../../../../../core/constant/app_constant.dart';

class ContainerTextFormFeild extends StatelessWidget {
  ContainerTextFormFeild({
    super.key,
    required this.isPass,
    required this.controller,
    required this.hint,
    required this.keyboardType,
    this.suffixIcon,
    this.suffixPressed,
  });
  final bool isPass;
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;
  IconData? suffixIcon;
  VoidCallback? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstant.deviceWidth(context),
      height: 47.h,
      decoration: BoxDecoration(
        color: const Color(AppColors.kLoginWithGoogleColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPass,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          border: InputBorder.none,
          hintText: hint,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: () {
                    suffixPressed?.call();
                  },
                  icon: Icon(
                    suffixIcon,
                    color: const Color(AppColors.kGreyColor),
                    size: 20,
                  ),
                )
              : null,
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
