import 'package:ecommerce_project/app_presentation/ui/screens/splash_screen.dart';
import 'package:ecommerce_project/app_presentation/ui/utilities/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: AppTheme.lightTheme,
      home:const SplashScreen(),
    );
  }
}