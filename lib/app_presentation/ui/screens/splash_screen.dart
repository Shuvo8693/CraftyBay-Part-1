import 'package:ecommerce_project/app_presentation/ui/screens/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../widgets/app_logo.dart';

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

  Future<void>nextScreen()async{
   await Future.delayed(const Duration(seconds: 3),()async{
      Get.off(const VerifyEmailScreen());
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
