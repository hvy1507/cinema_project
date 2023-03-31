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

  /// `Let sign in`
  String get letSignIn {
    return Intl.message(
      'Let sign in',
      name: 'letSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account `
  String get loginToAccount {
    return Intl.message(
      'Login to your account ',
      name: 'loginToAccount',
      desc: '',
      args: [],
    );
  }

  /// `Continue with `
  String get continuewith {
    return Intl.message(
      'Continue with ',
      name: 'continuewith',
      desc: '',
      args: [],
    );
  }

  /// `Create Your Account`
  String get createAccount {
    return Intl.message(
      'Create Your Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get remember {
    return Intl.message(
      'Remember me',
      name: 'remember',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signup {
    return Intl.message(
      'Sign up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signin {
    return Intl.message(
      'Sign in',
      name: 'signin',
      desc: '',
      args: [],
    );
  }

  /// `or continue with`
  String get orcontinue {
    return Intl.message(
      'or continue with',
      name: 'orcontinue',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already {
    return Intl.message(
      'Already have an account?',
      name: 'already',
      desc: '',
      args: [],
    );
  }

  /// `Dont have an account?`
  String get dont {
    return Intl.message(
      'Dont have an account?',
      name: 'dont',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with password`
  String get signInWithPass {
    return Intl.message(
      'Sign in with password',
      name: 'signInWithPass',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get hintPass {
    return Intl.message(
      'Password',
      name: 'hintPass',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get hintPhone {
    return Intl.message(
      'Phone Number',
      name: 'hintPhone',
      desc: '',
      args: [],
    );
  }

  /// `Congratulation!`
  String get congrat {
    return Intl.message(
      'Congratulation!',
      name: 'congrat',
      desc: '',
      args: [],
    );
  }

  /// `Success!`
  String get success {
    return Intl.message(
      'Success!',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgot {
    return Intl.message(
      'Forgot Password',
      name: 'forgot',
      desc: '',
      args: [],
    );
  }

  /// `Create New Password`
  String get createNewPassword {
    return Intl.message(
      'Create New Password',
      name: 'createNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Coming Soon`
  String get comingSoon {
    return Intl.message(
      'Coming Soon',
      name: 'comingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Voucher Deals`
  String get voucherDeal {
    return Intl.message(
      'Voucher Deals',
      name: 'voucherDeal',
      desc: '',
      args: [],
    );
  }

  /// `Now Showing`
  String get nowShowing {
    return Intl.message(
      'Now Showing',
      name: 'nowShowing',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Choose Seat`
  String get chooseSeat {
    return Intl.message(
      'Choose Seat',
      name: 'chooseSeat',
      desc: '',
      args: [],
    );
  }

  /// `Select Date and Time`
  String get selectDnT {
    return Intl.message(
      'Select Date and Time',
      name: 'selectDnT',
      desc: '',
      args: [],
    );
  }

  /// `Cast`
  String get cast {
    return Intl.message(
      'Cast',
      name: 'cast',
      desc: '',
      args: [],
    );
  }

  /// `Book Tickets`
  String get bookTicket {
    return Intl.message(
      'Book Tickets',
      name: 'bookTicket',
      desc: '',
      args: [],
    );
  }

  /// `Card Numbers`
  String get cardNumber {
    return Intl.message(
      'Card Numbers',
      name: 'cardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Name on Card`
  String get nameOnCard {
    return Intl.message(
      'Name on Card',
      name: 'nameOnCard',
      desc: '',
      args: [],
    );
  }

  /// `Security Code`
  String get securityCode {
    return Intl.message(
      'Security Code',
      name: 'securityCode',
      desc: '',
      args: [],
    );
  }

  /// `Expiry Date`
  String get expiry {
    return Intl.message(
      'Expiry Date',
      name: 'expiry',
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

  /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Add New Card`
  String get addNewCard {
    return Intl.message(
      'Add New Card',
      name: 'addNewCard',
      desc: '',
      args: [],
    );
  }

  /// `Movie Ticket`
  String get movieTicket {
    return Intl.message(
      'Movie Ticket',
      name: 'movieTicket',
      desc: '',
      args: [],
    );
  }

  /// `Thu`
  String get thu {
    return Intl.message(
      'Thu',
      name: 'thu',
      desc: '',
      args: [],
    );
  }

  /// `Fri`
  String get fri {
    return Intl.message(
      'Fri',
      name: 'fri',
      desc: '',
      args: [],
    );
  }

  /// `Sat`
  String get sat {
    return Intl.message(
      'Sat',
      name: 'sat',
      desc: '',
      args: [],
    );
  }

  /// `Mon`
  String get mon {
    return Intl.message(
      'Mon',
      name: 'mon',
      desc: '',
      args: [],
    );
  }

  /// `Sun`
  String get sun {
    return Intl.message(
      'Sun',
      name: 'sun',
      desc: '',
      args: [],
    );
  }

  /// `Tue`
  String get tue {
    return Intl.message(
      'Tue',
      name: 'tue',
      desc: '',
      args: [],
    );
  }

  /// `Wed`
  String get wed {
    return Intl.message(
      'Wed',
      name: 'wed',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code in`
  String get resendCode {
    return Intl.message(
      'Resend Code in',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Tap to search`
  String get tapToSearch {
    return Intl.message(
      'Tap to search',
      name: 'tapToSearch',
      desc: '',
      args: [],
    );
  }

  /// `Top Searches`
  String get topSearches {
    return Intl.message(
      'Top Searches',
      name: 'topSearches',
      desc: '',
      args: [],
    );
  }

  /// `English Movies`
  String get englishMovies {
    return Intl.message(
      'English Movies',
      name: 'englishMovies',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your Location`
  String get chooseyourLocations {
    return Intl.message(
      'Choose Your Location',
      name: 'chooseyourLocations',
      desc: '',
      args: [],
    );
  }

  /// `Choose you location and language to get the best movie recommendations that play in PVR Cinemas nearby your location. Don’t worry, you can always change it later.`
  String get chooseYouLocation {
    return Intl.message(
      'Choose you location and language to get the best movie recommendations that play in PVR Cinemas nearby your location. Don’t worry, you can always change it later.',
      name: 'chooseYouLocation',
      desc: '',
      args: [],
    );
  }

  /// `Choose Location`
  String get chooseLocation {
    return Intl.message(
      'Choose Location',
      name: 'chooseLocation',
      desc: '',
      args: [],
    );
  }

  /// `Choose Language`
  String get chooseLanguage {
    return Intl.message(
      'Choose Language',
      name: 'chooseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get eng {
    return Intl.message(
      'English',
      name: 'eng',
      desc: '',
      args: [],
    );
  }

  /// `Vietnamese`
  String get vie {
    return Intl.message(
      'Vietnamese',
      name: 'vie',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
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

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get userName {
    return Intl.message(
      'User Name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Email Id`
  String get email {
    return Intl.message(
      'Email Id',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Your account is ready to use. You will be redricted to the Home page in a few seconds..`
  String get accountReady {
    return Intl.message(
      'Your account is ready to use. You will be redricted to the Home page in a few seconds..',
      name: 'accountReady',
      desc: '',
      args: [],
    );
  }

  /// `Incompletion!`
  String get incompletion {
    return Intl.message(
      'Incompletion!',
      name: 'incompletion',
      desc: '',
      args: [],
    );
  }

  /// `Please complete the initialization of your profile`
  String get please {
    return Intl.message(
      'Please complete the initialization of your profile',
      name: 'please',
      desc: '',
      args: [],
    );
  }

  /// `Select the payment method you want to use`
  String get Payment {
    return Intl.message(
      'Select the payment method you want to use',
      name: 'Payment',
      desc: '',
      args: [],
    );
  }

  /// `Review Details`
  String get ReviewDetails {
    return Intl.message(
      'Review Details',
      name: 'ReviewDetails',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Cardholder Name`
  String get cardholder {
    return Intl.message(
      'Cardholder Name',
      name: 'cardholder',
      desc: '',
      args: [],
    );
  }

  /// `Romance`
  String get romance {
    return Intl.message(
      'Romance',
      name: 'romance',
      desc: '',
      args: [],
    );
  }

  /// `Adventure`
  String get adventure {
    return Intl.message(
      'Adventure',
      name: 'adventure',
      desc: '',
      args: [],
    );
  }

  /// `Comedy`
  String get comedy {
    return Intl.message(
      'Comedy',
      name: 'comedy',
      desc: '',
      args: [],
    );
  }

  /// `Documentary`
  String get documentary {
    return Intl.message(
      'Documentary',
      name: 'documentary',
      desc: '',
      args: [],
    );
  }

  /// `Action`
  String get action {
    return Intl.message(
      'Action',
      name: 'action',
      desc: '',
      args: [],
    );
  }

  /// `Science fiction`
  String get science {
    return Intl.message(
      'Science fiction',
      name: 'science',
      desc: '',
      args: [],
    );
  }

  /// `War`
  String get war {
    return Intl.message(
      'War',
      name: 'war',
      desc: '',
      args: [],
    );
  }

  /// `See more`
  String get see {
    return Intl.message(
      'See more',
      name: 'see',
      desc: '',
      args: [],
    );
  }

  /// `Once you buy a movie ticket simply scan the barcode to access to your movie.`
  String get movieTicketNotification {
    return Intl.message(
      'Once you buy a movie ticket simply scan the barcode to access to your movie.',
      name: 'movieTicketNotification',
      desc: '',
      args: [],
    );
  }

  /// `Two passwords are not the same, please re-enter`
  String get noti {
    return Intl.message(
      'Two passwords are not the same, please re-enter',
      name: 'noti',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password`
  String get wrong {
    return Intl.message(
      'Wrong password',
      name: 'wrong',
      desc: '',
      args: [],
    );
  }

  /// `Re-Enter`
  String get reEnter {
    return Intl.message(
      'Re-Enter',
      name: 'reEnter',
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

  /// `Please enter valid Phone Number`
  String get phoneAlert {
    return Intl.message(
      'Please enter valid Phone Number',
      name: 'phoneAlert',
      desc: '',
      args: [],
    );
  }

  /// `Take Photo`
  String get take {
    return Intl.message(
      'Take Photo',
      name: 'take',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
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
      Locale.fromSubtags(languageCode: 'vi'),
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
