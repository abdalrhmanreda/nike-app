import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike/core/cache/hive_cache.dart';
import 'package:nike/core/constant/strings.dart';
import 'package:nike/core/observer/blocObserver.dart';
import 'package:nike/ui/cubit/app_cubit.dart';
import 'package:nike/ui/feature/authentication/controller/auth_cubit.dart';
import 'package:nike/ui/feature/cart/controller/cart_cubit.dart';
import 'package:nike/ui/feature/fav/controllers/fav_cubit.dart';
import 'package:nike/ui/feature/home/controllers/product_cubit.dart';
import 'package:nike/ui/feature/product_details/controller/product_details_cubit.dart';

import 'config/routes/router.dart';
import 'config/routes/routes_path.dart';
import 'config/themes/themes.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveCache.openHive();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  userId = HiveCache.getData(key: 'userId') ?? '';
  bool onBoarding = HiveCache.getData(key: 'onBoarding') ?? false;
  Bloc.observer = MyBlocObserver();
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
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthCubit()),
            BlocProvider(create: (context) => AppCubit()),
            BlocProvider(create: (context) => ProductCubit()..getAllData()),
            BlocProvider(create: (context) => ProductDetailsCubit()),
            BlocProvider(create: (context) => FavCubit()..getFav()),
            BlocProvider(create: (context) => CartCubit()..getCart()),
          ],
          child: MaterialApp(
            onGenerateRoute: generateRoute,
            // home: startWidget,
            initialRoute: RoutePath.layout,
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
