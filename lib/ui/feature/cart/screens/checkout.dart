import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:nike/config/colors/app_colors.dart';
import 'package:nike/core/components/custom_app_bar.dart';
import 'package:nike/core/paymob/paymob_manager.dart';
import 'package:nike/ui/feature/cart/components/price_part.dart';
import 'package:nike/ui/feature/cart/controller/cart_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../authentication/controller/auth_cubit.dart';
import '../components/details_item.dart';
import '../components/location_image.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        leading: Icon(IconlyBroken.arrowLeft2),
        title: 'Cart',
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8.w),
            width: 340.w,
            padding: EdgeInsets.only(
              top: 10.h,
              right: 10.w,
              bottom: 10.h,
              left: 10.w,
            ),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              color: const Color(AppColors.kWhiteColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Information',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16.sp,
                      ),
                ),
                const Gap(10),
                DetailsItem(
                  title: AuthCubit.get(context).userModel!.email!,
                  subtitle: 'Email',
                  icon: IconlyBroken.message,
                ),
                const Gap(15),
                DetailsItem(
                  title: AuthCubit.get(context).userModel!.phone!,
                  subtitle: 'phone',
                  icon: IconlyBroken.call,
                ),
                const Gap(15),
                Text(
                  'Address',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16.sp,
                      ),
                ),
                Text(
                  AuthCubit.get(context).userModel!.address!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: const Color(AppColors.kGreyColor),
                      ),
                ),
                const Gap(5),
                locationImage(context),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: PricePart(
              onPressed: () {
                PaymobManager()
                    .getPaymentKey(
                        amount: CartCubit.get(context).totalPrice.toInt() *
                            100.toInt(),
                        currency: 'EGP')
                    .then((value) async {
                  await launchUrl(
                    Uri.parse(
                      'https://accept.paymobsolutions.com/api/acceptance/iframes/804387?payment_token=$value',
                    ),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
