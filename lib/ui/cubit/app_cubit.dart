import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nike/ui/feature/fav/screens/fav.dart';
import 'package:nike/ui/feature/home/screens/home.dart';
import 'package:nike/ui/feature/notification/screens/notification.dart';
import 'package:nike/ui/feature/profile/screens/profile_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Iconsax.home_1_outline),
      label: (''),
    ),
    const BottomNavigationBarItem(
      icon: Icon(Iconsax.heart_outline),
      label: (''),
    ),
    const BottomNavigationBarItem(
      icon: Icon(Iconsax.notification_bing_outline),
      label: (''),
    ),
    const BottomNavigationBarItem(
      icon: Icon(IconlyBroken.profile),
      label: (''),
    ),
  ];
  List<Widget> screens = const [
    HomeScreen(),
    FavScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];
  int currentIndex = 0;

  void chageBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBar());
  }
}
