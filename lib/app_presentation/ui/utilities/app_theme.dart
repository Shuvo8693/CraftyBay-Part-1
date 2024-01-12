import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme{

  static final lightTheme=ThemeData(
    //colorSchemeSeed: ,  this is change default color property like primary swatch
      primaryColor: AppColors.primaryColor,
      primarySwatch: MaterialColor(AppColors.primaryColor.value, AppColors.colorSwatch),
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColors.primaryColor,),
      textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 40,fontWeight: FontWeight.w500),
          titleLarge: TextStyle(fontSize: 18)
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor), //MaterialStatePropertyAll(AppColors.colorSwatch.values.elementAt(5)) for swatch colors
          foregroundColor: MaterialStatePropertyAll(Colors.white),
          textStyle: MaterialStatePropertyAll(TextStyle(letterSpacing: 0.5)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.grey.shade400,),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor)),
        disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor)),
        contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: AppColors.primaryColor)),
      )
  );
}
