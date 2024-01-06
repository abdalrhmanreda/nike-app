import 'package:flutter/material.dart';
import 'package:nike/config/routes/routes_path.dart';
import 'package:nike/ui/feature/splash_screen/screens/splash_screen.dart';

import '../../ui/feature/splash_screen/screens/on_boarding_screen.dart';

Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutePath.onBoarding:
      return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
    case RoutePath.splash:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    // case RoutePath.signUp:
    //   return MaterialPageRoute(builder: (_) => const RegisterScreen());
    // case RoutePath.otpCode:
    //   return MaterialPageRoute(builder: (_) => const OtpCodeScreen());
    // case RoutePath.layout:
    //   return MaterialPageRoute(builder: (_) => const LayoutScreen());
    // case RoutePath.courseDetails:
    //   return MaterialPageRoute(builder: (_) => const CourseDetailsScreen());
    // case RoutePath.lectureDetails:
    //   return MaterialPageRoute(builder: (_) => const LectureDetailsScreen());
    // case RoutePath.profile:
    //   return MaterialPageRoute(builder: (_) => const ProfileScreen());
    // // case RoutePath.home:
    // //   return MaterialPageRoute(builder: (_) => const HomeScreen());
    // // case RoutePath.rating:
    // //   return MaterialPageRoute(builder: (_) => const RatingScreen());
    // // case RoutePath.download:
    // //   return MaterialPageRoute(builder: (_) => const DownLoadScreen());
    // // case RoutePath.wallet:
    // //   return MaterialPageRoute(builder: (_) => const WalletScreen());
  }
}
