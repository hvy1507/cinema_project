import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/screens/Payment_method/Add_New_Card.dart';
import 'package:flutter_cinema_app/screens/Payment_method/payment_method_screen.dart';
import 'package:flutter_cinema_app/screens/account_setup/choose_location.dart';
import 'package:flutter_cinema_app/screens/account_setup/profile_setup.dart';
import 'package:flutter_cinema_app/screens/detail_screen/choose_datetime_page.dart';
import 'package:flutter_cinema_app/screens/detail_screen/detail_film_page.dart';
import 'package:flutter_cinema_app/screens/home/home_page.dart';

import 'package:flutter_cinema_app/screens/loginscreen/lets_sign_in.dart';
import 'package:flutter_cinema_app/screens/loginscreen/login_screen.dart';
import 'package:flutter_cinema_app/screens/loginscreen/register_screen.dart';
import 'package:flutter_cinema_app/screens/forgot_password.dart';
import 'package:flutter_cinema_app/screens/reset_password.dart';
import 'package:flutter_cinema_app/screens/send_otp.dart';
import 'package:flutter_cinema_app/screens/ticket/payment_screen.dart';
import 'package:flutter_cinema_app/screens/ticket/seat_booking.dart';
import 'package:flutter_cinema_app/screens/splash_screen.dart';
import 'package:flutter_cinema_app/screens/intro/intro_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String letsSignIn = '/letsSignIn';
  static const String introScreen = '/introScreen';
  static const String homePage = '/homePage';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String orderFood = '/orderFood';
  static const String foodDetails = '/foodDetails';
  static const String parkingcharge = '/parkingcharge';

  static const String chooseLocation = '/chooseLocation';
  static const String profileSetup = '/rprofileSetup';
  static const String englishMovieScreen = '/englishMovieScreen';
  static const String paymentMethod = '/paymentMethod';
  static const String addNewCard = '/addNewCard';
  static const String paymentScreen = '/paymentScreen';
  static const String seatScreen = '/seatScreen';
  static const String seeMoreScreen = '/seeMoreScreen';
  static const String otpScreen = '/otpScreen';
  static const String forgot = '/forgot';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String chooseDateTimePage = '/chooseDateTimePage';
  static const String detailFilmPage = '/detailFilmPage';



  static final routes = <String, WidgetBuilder>{
    splashScreen: (BuildContext context) => const SplashScreen(),
    letsSignIn: (BuildContext context) => const LetSignIn(),
    registerScreen: (BuildContext context) => const Register(),
    introScreen: (BuildContext context) => const IntroScreen(),
    homePage: (BuildContext context) => const HomePage(),
    chooseLocation: (BuildContext context) => const ChooseLocation(),
    profileSetup: (BuildContext context) => ProfileSetup(),
    paymentMethod: (BuildContext context) => const PaymentMethod(),
    addNewCard: (BuildContext context) => AddNewCard(),
    paymentScreen: (BuildContext context) => const PaymentScreen(),
    seatScreen: (BuildContext context) => const SeatScreen(),
    otpScreen: (BuildContext context) => const OTPScreen(),
    forgot: (BuildContext context) => const SendOTPScreen(),
    resetPasswordScreen: (BuildContext context) => const ResetPasswordScreen(),
    loginScreen: (BuildContext context) => const LoginScreen(),
    chooseDateTimePage: (BuildContext context) => const ChooseDateTimePage(),
    detailFilmPage: (BuildContext context) => const DetailFilmPage(),



  };
}
