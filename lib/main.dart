import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Features/Splash/Presentation/View/splash_view.dart';
import 'constants.dart';

void main() {
  runApp(const Pickbook());
}

class Pickbook extends StatelessWidget {
  const Pickbook({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pickbook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: _createMaterialColor(kPrimaryColor),
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kLightGrayColor,
        appBarTheme: AppBarTheme(
          backgroundColor: kPrimaryColor,
          foregroundColor: kAccentColor,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryColor,
          primary: kPrimaryColor,
          secondary: kSecondaryColor,
          surface: kLightGrayColor,
          background: kLightGrayColor,
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(color: kSecondaryColor),
          headlineMedium: TextStyle(color: kSecondaryColor),
          headlineSmall: TextStyle(color: kSecondaryColor),
          bodyLarge: TextStyle(color: kTextColor),
          bodyMedium: TextStyle(color: kTextColor),
          bodySmall: TextStyle(color: kTextColor),
        ),
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }

  // Helper method to create MaterialColor from Color
  MaterialColor _createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
