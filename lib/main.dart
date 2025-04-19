import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taxi_receipt/routes/routs_screen.dart';
import 'package:taxi_receipt/screens/driver/driver_home_screen.dart';
import 'package:taxi_receipt/theme.dart';
import 'localization/app_localizations.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://benbphmzvxkfjwzbngpl.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJlbmJwaG16dnhrZmp3emJuZ3BsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQ5NzcyNjgsImV4cCI6MjA2MDU1MzI2OH0.UfvVySli5Yj1ai-cW--H9wJ6gpKnj7f8Rgjl6ZPSBHM',
  );

  runApp(const TaxiApp());
}

class TaxiApp extends StatelessWidget {
  const TaxiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Taxi App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,

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

      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
