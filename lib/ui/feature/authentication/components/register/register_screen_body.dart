import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:nike/core/components/progress_indector.dart';
import 'package:nike/ui/feature/authentication/components/common/sign_with_google.dart';

import '../../../../../../config/colors/app_colors.dart';
import '../../../../../../core/components/custom_button.dart';
import '../../../../../../core/constant/app_constant.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../config/routes/routes_path.dart';
import '../../../../../core/components/custom_navigatation.dart';
import '../../controller/auth_cubit.dart';
import '../common/build_text_next_to_text_button.dart';
import '../common/build_two_text_form_field.dart';
import 'full_name.dart';

class RegisterScreenBody extends StatelessWidget {
  RegisterScreenBody({super.key});

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is RegisterSuccessState) {
          // showToast(
          //   message: 'Created account successfully',
          //   state: ToastState.SUCCESS,
          // );
          // ApiConstant.token = state.token;
          CustomNavigation.navigateByNamedTo(context, RoutePath.layout);
        } else if (state is FailureState) {
          // showToast(message: state.error, state: ToastState.ERROR);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: AppConstant.deviceHeight(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).signUp,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        S.of(context).registerScreenDescription,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(30),
                      TitleAndTextFormFeild(
                        nameController: nameController,
                        title: S.of(context).registerFullName,
                        hint: 'xxxxxxxxx',
                      ),
                      const Gap(20),
                      TitleAndTextFormFeild(
                        nameController: phoneController,
                        title: 'Phone',
                        hint: '+20100000000',
                      ),
                      const Gap(20),
                      CustomTwoTextFromField(
                        controller1: emailController,
                        controller2: passController,
                        hint1: S.of(context).loginScreenEmail,
                        hint2: S.of(context).loginScreenPass,
                      ),
                      const Gap(30),
                      ConditionalBuilder(
                        condition: state is! LoadingState,
                        builder: (context) => CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              AuthCubit.get(context).userRegister(
                                  email: emailController.text,
                                  password: passController.text,
                                  name: nameController.text,
                                  phone: phoneController.text);
                            }
                          },
                          text: S.of(context).signUp,
                          height: 37.h,
                          color: AppColors.kPrimaryColor,
                          width: AppConstant.deviceWidth(context),
                          horizontal: 0,
                          vertical: 0,
                          radius: 10,
                          textColor: AppColors.kWhiteColor,
                          fontSize: 20,
                        ),
                        fallback: (context) => const CustomLoadingIndicator(),
                      ),
                      const Gap(20),
                      const SignWithGoogle(text: "Sign up with Google "),
                      const Gap(10),
                      customTextNextToTextButton(
                          context: context,
                          text: S.of(context).registerScreenHaveAccount,
                          textButton: S.of(context).loginScreenButton,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
