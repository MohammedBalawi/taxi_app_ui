import 'package:flutter/material.dart';

import '../screens/auth/check/check_screen.dart';
import '../screens/auth/home/home_screen.dart';
import '../screens/auth/login/login_screen.dart';
import '../screens/auth/signUp/sign_up_screen.dart';
import '../screens/carPay/car_payment_screen.dart';
import '../screens/driver/tracking_screen.dart';
import '../screens/launch/launch_screen.dart';
import '../screens/rating/rating_screen.dart';
import '../screens/select/select_destination_screen.dart';
import '../screens/settings/settings_screen.dart';


Map<String, WidgetBuilder> appRoutes = {

    '/': (context) => const SplashScreen(),
    '/login': (context) => const LoginScreen(),
    '/signup': (context) => const SignupScreen(),
    '/home': (context) => const HomeScreen(),
    '/destination': (context) => const SelectDestinationScreen(),
    '/car_payment': (context) => const CarPaymentScreen(rideId: '',),
    '/tracking': (context) => const TrackingScreen(rideId: ''),
    '/rating': (context) => const RatingScreen(rideId: ''),
    '/settings': (context) => const SettingsScreen(),
    '/check': (context) => const CheckAuthScreen(),



};