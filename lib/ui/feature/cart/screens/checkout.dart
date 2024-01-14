import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:nike/config/colors/app_colors.dart';
import 'package:nike/core/components/custom_app_bar.dart';
import 'package:nike/ui/feature/authentication/controller/auth_cubit.dart';
import 'package:nike/ui/feature/cart/components/price_part.dart';
import 'package:nike/ui/feature/cart/controller/cart_cubit.dart';
import 'package:paymob_payment/paymob_payment.dart';

import '../../../../core/paymob/paymob_api.dart';
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
              right: 3.w,
              bottom: 10.h,
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
                const DetailsItem(
                  title: 'abdalrhman@gmail.com',
                  subtitle: 'Email',
                  icon: IconlyBroken.message,
                ),
                const Gap(15),
                const DetailsItem(
                  title: '00000000000000',
                  subtitle: 'Email',
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
                PaymobPayment.instance
                    .initialize(
                  apiKey: PaymobApi
                      .paymobApiKey, // from dashboard Select Settings -> Account Info -> API Key
                  integrationID: PaymobApi
                      .paymobIntegrationId, // from dashboard Select Developers -> Payment Integrations -> Online Card ID
                  iFrameID: 804387, // from paymob Select Developers -> iframes
                )
                    .then((value) async {
                  final PaymobResponse? response2 =
                      await PaymobPayment.instance.pay(
                    currency: "EGP",
                    amountInCents: {CartCubit.get(context).totalPrice * 100}
                        .toString(), // 200 EGP
                    onPayment: (response) =>
                        print('----------------------${response.toString()}'),
                    context: context, // Optional
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
