import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/routes/router.dart';
import 'config/routes/routes_path.dart';
import 'config/themes/themes.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const NikeApp());
}

class NikeApp extends StatelessWidget {
  const NikeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return SafeArea(
          child: MaterialApp(
            onGenerateRoute: generateRoute,
            // home: startWidget,
            initialRoute: RoutePath.onBoarding,
            locale: const Locale('en', 'US'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: Style.lightTheme,
            darkTheme: Style.darkTheme,
            themeMode: ThemeMode.light,
          ),
        );
      },
    );
  }
}

/*
* <a class="product-card__link-overlay" data-testid="product-card__link-overlay" href="https://www.nike.com/t/air-jordan-1-mid-womens-shoes-TB9sVQ/BQ6472-160" tabindex="-1">Air Jordan 1 Mid</a>
*<a class="product-card__link-overlay" data-testid="product-card__link-overlay" href="https://www.nike.com/t/air-jordan-1-low-se-craft-mens-shoes-1ppvgD/FD8635-001" tabindex="-1">Air Jordan 1 Low SE Craft</a>
* */
