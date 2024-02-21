import 'package:ecommerce_project/app_presentation/stateHolder/auth_controller.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/auth/signup_profile_screen.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/bottom_nav_bar_screen.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/review_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/app_logo.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    nextScreen();
  }

  Future<void> nextScreen() async {
    await Future.delayed(const Duration(seconds: 3), (){
      Get.off(const BottomNavBarScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
             children: [
            Spacer(
              flex: 5,
            ),
            AppLogo(
              height: 120,
            ),
            Spacer(
              flex: 3,
            ),
            CircularProgressIndicator(),
            SizedBox(
              height: 30,
            ),
            Text(
              'Version 1.0',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      )),
    );
  }
}
