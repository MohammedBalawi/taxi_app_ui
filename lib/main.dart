import 'package:flutter/material.dart';
import 'package:taxi_receipt/theme.dart';
import 'localization/app_localizations.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/select_destination_screen.dart';
import 'screens/car_payment_screen.dart';
import 'screens/tracking_screen.dart';
import 'screens/rating_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const NovaTaxiApp());
}

class NovaTaxiApp extends StatelessWidget {
  const NovaTaxiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nova Taxi App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],


      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/destination': (context) => const SelectDestinationScreen(),
        '/car_payment': (context) => const CarPaymentScreen(),
        '/tracking': (context) => const TrackingScreen(),
        '/rating': (context) => const RatingScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
