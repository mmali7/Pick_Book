import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Features/Splash/Presentation/View/splash_view.dart';

void main() {
  runApp(const Pickbook());
}

class Pickbook extends StatelessWidget {
  const Pickbook({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: SplashView());
  }
}
