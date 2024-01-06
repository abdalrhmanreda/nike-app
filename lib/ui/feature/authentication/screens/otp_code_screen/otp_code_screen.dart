import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../core/components/custom_button.dart';
import '../../../../../../core/components/progress_indector.dart';
import '../../../../../../core/constant/app_constant.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../config/colors/app_colors.dart';
import '../../components/common/build_rich_text.dart';
import '../../controller/auth_cubit.dart';

class OtpCodeScreen extends StatelessWidget {
  const OtpCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // if (state is ConfirmEmailSuccessState) {
          //   CustomNavigation.navigateAndFinishNyNamed(
          //       context, RoutePath.layout);
          //   showToast(
          //       message: 'Account Created Successfully',
          //       state: ToastState.SUCCESS);
          // } else if (state is SignUpFailure) {
          //   showToast(message: state.error, state: ToastState.ERROR);
          // }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomRichText(
                  textPartOne:
                      S.of(context).otpCodeEnter + S.of(context).otpCodeCode,
                  textPartTwo: '',
                ),
                Text(
                  'We have sent code to adba@gmail.com',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 16.sp,
                        color: const Color(AppColors.kGreyColor),
                      ),
                ),
                const Gap(10),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  pinTheme: PinTheme(
                      borderRadius: BorderRadius.circular(10),
                      shape: PinCodeFieldShape.box,
                      inactiveColor: const Color(AppColors.kGreyColor)
                      // inactiveColor: Color(value),
                      ),
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  onChanged: (value) {},
                  cursorColor: const Color(AppColors.kLoginWithGoogleColor),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onCompleted: (value) {
                    print(value);
                    // AuthCubit.get(context).confirmEmail(code: value);
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  appContext: context,
                ),
                const Gap(25),
                ConditionalBuilder(
                  condition: state is! LoadingState,
                  builder: (context) => CustomButton(
                    onPressed: () {
                      // AuthCubit.get(context)
                      //     .confirmEmail(code: ApiConstant.code);
                    },
                    text: S.of(context).submit,
                    height: 37.h,
                    color: AppColors.kPrimaryColor,
                    width: AppConstant.deviceWidth(context),
                    horizontal: 10,
                    vertical: 0,
                    radius: 10,
                    textColor: AppColors.kWhiteColor,
                    fontSize: 20,
                  ),
                  fallback: (context) => const CustomLoadingIndicator(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
