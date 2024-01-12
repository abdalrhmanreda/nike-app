import 'package:flutter/material.dart';
import 'package:nike/config/routes/routes_path.dart';
import 'package:nike/ui/feature/authentication/screens/login_screen/login_screen.dart';
import 'package:nike/ui/feature/authentication/screens/otp_code_screen/otp_code_screen.dart';
import 'package:nike/ui/feature/cart/screens/cart.dart';
import 'package:nike/ui/feature/fav/screens/fav.dart';
import 'package:nike/ui/feature/product_details/screens/product_details.dart';
import 'package:nike/ui/feature/search/screens/search.dart';
import 'package:nike/ui/feature/splash_screen/screens/splash_screen.dart';

import '../../ui/feature/authentication/screens/register_screen/register_screen.dart';
import '../../ui/feature/home/models/ProductModel.dart';
import '../../ui/feature/layout/screens/layout.dart';
import '../../ui/feature/payment/screens/payment.dart';
import '../../ui/feature/splash_screen/screens/on_boarding_screen.dart';

Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutePath.onBoarding:
      return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
    case RoutePath.splash:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case RoutePath.signUp:
      return MaterialPageRoute(builder: (_) => const RegisterScreen());
    case RoutePath.login:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case RoutePath.otpCode:
      return MaterialPageRoute(builder: (_) => const OtpCodeScreen());
    case RoutePath.layout:
      return MaterialPageRoute(builder: (_) => const LayoutScreen());
    case RoutePath.cartScreen:
      return MaterialPageRoute(builder: (_) => const CartScreen());
    case RoutePath.searchScreen:
      return MaterialPageRoute(builder: (_) => const SearchScreen());
    case RoutePath.favScreen:
      return MaterialPageRoute(builder: (_) => const FavScreen());
    case RoutePath.paymentScreen:
      return MaterialPageRoute(builder: (_) => const PaymentScreen());
    case RoutePath.productDetailsScreen:
      return MaterialPageRoute(
        builder: (_) => ProductDetailsScreen(
          productModel: settings.arguments as ProductModel,
          index: settings.arguments.toString(),
        ),
      );
  }
}
