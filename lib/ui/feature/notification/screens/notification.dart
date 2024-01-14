import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:nike/core/components/custom_navigatation.dart';
import 'package:nike/core/components/progress_indector.dart';
import 'package:nike/ui/feature/notification/controllers/notification_cubit.dart';
import 'package:nike/ui/feature/product_details/screens/product_details.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/constant/app_constant.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationCubit, NotificationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ConditionalBuilder(
            condition: state is! NotificationLoading,
            builder: (context) => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.all(10.h),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      CustomNavigation.navigateTo(
                          context,
                          ProductDetailsScreen(
                              productModel: NotificationCubit.get(context)
                                  .notificationList[index],
                              index: index.toString()));
                    },
                    child: Container(
                      width: AppConstant.deviceWidth(context),
                      height: 95.h,
                      padding: EdgeInsets.only(
                        left: 8.w,
                      ),
                      decoration: ShapeDecoration(
                        color: const Color(AppColors.kWhiteColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CachedNetworkImage(
                            imageUrl: NotificationCubit.get(context)
                                .notificationList[index]
                                .image!,
                            fit: BoxFit.fill,
                            width: AppConstant.deviceWidth(context) / 4,
                            height: 85.h,
                          ),
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: AppConstant.deviceWidth(context) / 2,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your order has been in cart successfully',
                                  style: TextStyle(
                                    color: const Color(AppColors.kPrimaryColor),
                                    fontSize: 16.sp,
                                    height: 1.2,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Gap(5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${NotificationCubit.get(context).notificationList[index].initialPrice}',
                                      style: TextStyle(
                                        color:
                                            const Color(AppColors.kBlackColor),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    Text(
                                      '\$${NotificationCubit.get(context).notificationList[index].initialPrice! * .2}',
                                      style: TextStyle(
                                        color:
                                            const Color(AppColors.kGreyColor),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const Gap(15),
                  itemCount:
                      NotificationCubit.get(context).notificationList.length,
                ),
            fallback: (context) => const CustomLoadingIndicator());
      },
    );
  }
}
