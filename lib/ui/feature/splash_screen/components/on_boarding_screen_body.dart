import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/routes/routes_path.dart';
import '../../../../core/cache/hive_cache.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/components/custom_navigatation.dart';
import '../../../../core/components/custom_smooth_indicator.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import 'on_boarding1/on_boarding1.dart';
import 'on_boarding2.dart';
import 'on_boarding3.dart';
import 'on_boarding_item_content/on_boarding_item_content.dart';

class OnBoardingScreenBody extends StatefulWidget {
  const OnBoardingScreenBody({super.key});

  @override
  State<OnBoardingScreenBody> createState() => _OnBoardingScreenBodyState();
}

class _OnBoardingScreenBodyState extends State<OnBoardingScreenBody> {
  List<Widget> screens(context) => [
        OnBoarding1(
          onBoardingItemContent: OnBoardingItemContent(
            title: S.of(context).onBoardingTitle1,
            description: S.of(context).onBoardingDescription1,
            image: Assets.onBoarding1OnBoarding1,
          ),
        ),
        OnBoarding2(
          onBoardingItemContent: OnBoardingItemContent(
            title: S.of(context).onBoardingTitle2,
            description: S.of(context).onBoardingDescription2,
            image: Assets.onBoarding1OnBoarding1,
          ),
        ),
        OnBoarding3(
          onBoardingItemContent: OnBoardingItemContent(
            title: S.of(context).onBoardingTitle3,
            description: S.of(context).onBoardingDescription3,
            image: Assets.onBoarding1OnBoarding33,
          ),
        ),
      ];

// Usage
  PageController pageController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(AppColors.kPrimaryColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                onPageChanged: _onPageChanged,
                controller: pageController,
                itemCount: screens(context).length,
                itemBuilder: (context, index) => screens(context)[index],
              ),
            ),
            CustomSmoothIndicator(
                pageController: pageController, count: screens(context).length),
            const Gap(20),
            CustomButton(
              onPressed: () {
                if (isLast) {
                  HiveCache.saveData(key: 'onBoarding', value: true)
                      .then((value) {
                    CustomNavigation.navigateAndFinishNyNamed(
                        context, RoutePath.login);
                  });
                } else {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.fastEaseInToSlowEaseOut);
                }
              },
              text: S.of(context).onBoardingButtonText,
              height: 42.h,
              width: MediaQuery.of(context).size.width,
              vertical: 20.h,
              horizontal: 20,
              radius: 10,
              color: AppColors.kWhiteColor,
              textColor: AppColors.kBlackColor,
              fontSize: 18.sp,
            ),
          ],
        ),
      ),
    );
  }

  void _onPageChanged(index) {
    if (index == screens(context).length - 1) {
      setState(() {
        isLast = true;
      });
    } else {
      setState(() {
        isLast = false;
      });
    }
  }
}
