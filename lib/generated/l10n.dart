// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Nike`
  String get appName {
    return Intl.message(
      'Nike',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to \nNike`
  String get onBoardingTitle1 {
    return Intl.message(
      'Welcome to \nNike',
      name: 'onBoardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Discover a world of knowledge and learning at your fingertips with 3almni. We're here to guide you through an enriching educational journey`
  String get onBoardingDescription1 {
    return Intl.message(
      'Discover a world of knowledge and learning at your fingertips with 3almni. We\'re here to guide you through an enriching educational journey',
      name: 'onBoardingDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Let’s Start Journey \nWith Nike`
  String get onBoardingTitle2 {
    return Intl.message(
      'Let’s Start Journey \nWith Nike',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Smart, Gorgeous & Fashionable Collection Explor Now`
  String get onBoardingDescription2 {
    return Intl.message(
      'Smart, Gorgeous & Fashionable Collection Explor Now',
      name: 'onBoardingDescription2',
      desc: '',
      args: [],
    );
  }

  /// `You Have the Power To`
  String get onBoardingTitle3 {
    return Intl.message(
      'You Have the Power To',
      name: 'onBoardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `There Are Many Beautiful And Attractive Plants To Your Room`
  String get onBoardingDescription3 {
    return Intl.message(
      'There Are Many Beautiful And Attractive Plants To Your Room',
      name: 'onBoardingDescription3',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get onBoardingButtonText {
    return Intl.message(
      'Next',
      name: 'onBoardingButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get onBoardingTextButtonText {
    return Intl.message(
      'Skip',
      name: 'onBoardingTextButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Hello Again!`
  String get loginScreenTitlePartOne {
    return Intl.message(
      'Hello Again!',
      name: 'loginScreenTitlePartOne',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get loginScreenTitlePartTwo {
    return Intl.message(
      ' ',
      name: 'loginScreenTitlePartTwo',
      desc: '',
      args: [],
    );
  }

  /// `example@gmail.com`
  String get loginScreenEmail {
    return Intl.message(
      'example@gmail.com',
      name: 'loginScreenEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email {
    return Intl.message(
      'Email Address',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `********`
  String get loginScreenPass {
    return Intl.message(
      '********',
      name: 'loginScreenPass',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get loginScreenButton {
    return Intl.message(
      'Sign in',
      name: 'loginScreenButton',
      desc: '',
      args: [],
    );
  }

  /// `New User?`
  String get loginScreenHaveNotAccount {
    return Intl.message(
      'New User?',
      name: 'loginScreenHaveNotAccount',
      desc: '',
      args: [],
    );
  }

  /// `create account`
  String get loginScreenCreateAccount {
    return Intl.message(
      'create account',
      name: 'loginScreenCreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Recovery Password`
  String get loginScreenForgetPass {
    return Intl.message(
      'Recovery Password',
      name: 'loginScreenForgetPass',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get registerFullName {
    return Intl.message(
      'Full name',
      name: 'registerFullName',
      desc: '',
      args: [],
    );
  }

  /// `Sign`
  String get sign {
    return Intl.message(
      'Sign',
      name: 'sign',
      desc: '',
      args: [],
    );
  }

  /// `up`
  String get up {
    return Intl.message(
      'up',
      name: 'up',
      desc: '',
      args: [],
    );
  }

  /// `Sign up with Google `
  String get signUpWithGoogle {
    return Intl.message(
      'Sign up with Google ',
      name: 'signUpWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google `
  String get signInWithGoogle {
    return Intl.message(
      'Sign in with Google ',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get registerScreenHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'registerScreenHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Fill your details or continue with\nsocial media`
  String get loginDesc {
    return Intl.message(
      'Fill your details or continue with\nsocial media',
      name: 'loginDesc',
      desc: '',
      args: [],
    );
  }

  /// `Fill your details or continue with\nsocial media`
  String get registerScreenDescription {
    return Intl.message(
      'Fill your details or continue with\nsocial media',
      name: 'registerScreenDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get otpCodeEnter {
    return Intl.message(
      'Enter',
      name: 'otpCodeEnter',
      desc: '',
      args: [],
    );
  }

  /// ` OTP`
  String get otpCodeCode {
    return Intl.message(
      ' OTP',
      name: 'otpCodeCode',
      desc: '',
      args: [],
    );
  }

  /// `Verify OTP`
  String get submit {
    return Intl.message(
      'Verify OTP',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message(
      'Rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message(
      'Download',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `wallet`
  String get wallet {
    return Intl.message(
      'wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Subjects`
  String get subjects {
    return Intl.message(
      'Subjects',
      name: 'subjects',
      desc: '',
      args: [],
    );
  }

  /// `view pdf lecture`
  String get viewPdfLecture {
    return Intl.message(
      'view pdf lecture',
      name: 'viewPdfLecture',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Lecture`
  String get lecture {
    return Intl.message(
      'Lecture',
      name: 'lecture',
      desc: '',
      args: [],
    );
  }

  /// `Files`
  String get files {
    return Intl.message(
      'Files',
      name: 'files',
      desc: '',
      args: [],
    );
  }

  /// `Choose Pay Method`
  String get choosePayment {
    return Intl.message(
      'Choose Pay Method',
      name: 'choosePayment',
      desc: '',
      args: [],
    );
  }

  /// `you can choose the most suitable \npayment method for payment`
  String get walletDesc {
    return Intl.message(
      'you can choose the most suitable \npayment method for payment',
      name: 'walletDesc',
      desc: '',
      args: [],
    );
  }

  /// `Vodafone cash`
  String get vodafone {
    return Intl.message(
      'Vodafone cash',
      name: 'vodafone',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message(
      'Cash',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get cart {
    return Intl.message(
      'My Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Account Details`
  String get accountDetails {
    return Intl.message(
      'Account Details',
      name: 'accountDetails',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get explore {
    return Intl.message(
      'Explore',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `Looking for shoes`
  String get lookingFor {
    return Intl.message(
      'Looking for shoes',
      name: 'lookingFor',
      desc: '',
      args: [],
    );
  }

  /// `Select Category`
  String get selectCategory {
    return Intl.message(
      'Select Category',
      name: 'selectCategory',
      desc: '',
      args: [],
    );
  }

  /// `Popular Shoes`
  String get popularShoes {
    return Intl.message(
      'Popular Shoes',
      name: 'popularShoes',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Home Screen`
  String get homeScreen {
    return Intl.message(
      'Home Screen',
      name: 'homeScreen',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Screen`
  String get favoriteScreen {
    return Intl.message(
      'Favorite Screen',
      name: 'favoriteScreen',
      desc: '',
      args: [],
    );
  }

  /// `Cart Screen`
  String get cartScreen {
    return Intl.message(
      'Cart Screen',
      name: 'cartScreen',
      desc: '',
      args: [],
    );
  }

  /// `Profile Screen`
  String get profileScreen {
    return Intl.message(
      'Profile Screen',
      name: 'profileScreen',
      desc: '',
      args: [],
    );
  }

  /// `Notification Screen`
  String get notificationScreen {
    return Intl.message(
      'Notification Screen',
      name: 'notificationScreen',
      desc: '',
      args: [],
    );
  }

  /// `Settings Screen`
  String get settingsScreen {
    return Intl.message(
      'Settings Screen',
      name: 'settingsScreen',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us Screen`
  String get contactUsScreen {
    return Intl.message(
      'Contact Us Screen',
      name: 'contactUsScreen',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Home Screen`
  String get homeScreenTitle {
    return Intl.message(
      'Home Screen',
      name: 'homeScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Screen`
  String get favoriteScreenTitle {
    return Intl.message(
      'Favorite Screen',
      name: 'favoriteScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cart Screen`
  String get cartScreenTitle {
    return Intl.message(
      'Cart Screen',
      name: 'cartScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Profile Screen`
  String get profileScreenTitle {
    return Intl.message(
      'Profile Screen',
      name: 'profileScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Notification Screen`
  String get notificationScreenTitle {
    return Intl.message(
      'Notification Screen',
      name: 'notificationScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Settings Screen`
  String get settingsScreenTitle {
    return Intl.message(
      'Settings Screen',
      name: 'settingsScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us Screen`
  String get contactUsScreenTitle {
    return Intl.message(
      'Contact Us Screen',
      name: 'contactUsScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Shoes`
  String get shoes {
    return Intl.message(
      'Shoes',
      name: 'shoes',
      desc: '',
      args: [],
    );
  }

  /// `Sneaker Shop`
  String get sneakerShop {
    return Intl.message(
      'Sneaker Shop',
      name: 'sneakerShop',
      desc: '',
      args: [],
    );
  }

  /// `Add To Cart`
  String get addToCart {
    return Intl.message(
      'Add To Cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Add To Favorite`
  String get addToFavorite {
    return Intl.message(
      'Add To Favorite',
      name: 'addToFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Add To WishList`
  String get addToWishList {
    return Intl.message(
      'Add To WishList',
      name: 'addToWishList',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Add Product`
  String get addProduct {
    return Intl.message(
      'Add Product',
      name: 'addProduct',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
