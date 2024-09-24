
import 'package:ecommerce_project/app_presentation/ui/utilities/app_theme.dart';
import 'package:ecommerce_project/bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app_presentation/ui/screens/auth/splash_screen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialBinding: StateBinding(),
      home:const SplashScreen(),
    );
  }
}