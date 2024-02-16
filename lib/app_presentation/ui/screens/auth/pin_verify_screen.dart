import 'dart:async';
import 'package:ecommerce_project/app_presentation/stateHolder/auth_controller.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/otp_state.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/auth/signup_profile_screen.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/bottom_nav_bar_screen.dart';
import 'package:ecommerce_project/app_presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../widgets/app_logo.dart';

class PinVerifyScreen extends StatefulWidget {
  const PinVerifyScreen({super.key, required this.email});

  final String email;

  @override
  State<PinVerifyScreen> createState() => _PinVerifyScreenState();
}

class _PinVerifyScreenState extends State<PinVerifyScreen> {
  final TextEditingController _pinTEC = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int counter = 12;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    countingTimeDelay();
  }

  Future<void> countingTimeDelay() async {
    // 2 sec delay koar por counting hobe
    Future.delayed(const Duration(seconds: 2), () {
      timerSecond();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  const AppLogo(
                    height: 110,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text('Enter OTP Code',
                      style: Theme.of(context).textTheme.displayLarge),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text('A 4 digit Otp code has been send',
                      style: TextStyle(color: Colors.grey, fontSize: 15)),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: PinCodeTextField(
                      controller: _pinTEC,
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: false,
                      obscuringCharacter: '*',
                      // obscuringWidget: const FlutterLogo(
                      //   size: 10,
                      // ),
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 4) {
                          return "fill your code here";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 45,
                        fieldWidth: 45,
                        activeFillColor: Colors.white,
                        activeColor: Colors.green,
                        inactiveFillColor: Colors.white,
                        inactiveColor: Colors.redAccent,
                        selectedFillColor: Colors.white,
                        selectedColor: AppColors.primaryColor,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: GetBuilder<OtpState>(
                          builder: (otpState) {
                        return Visibility(
                          visible: otpState.inProgress==false,
                          replacement: const Center(child: CircularProgressIndicator(),),
                          child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  bool response = await otpState.verifyOtpState(
                                      widget.email, _pinTEC.text.trim());
                                  if (response) {
                                    if (otpState.shouldINavigateCompleteProfile) {
                                      Get.to(()=>const SignUpProfileScreen());
                                    } else {
                                      Get.offAll(()=>const BottomNavBarScreen());
                                    }
                                  } else {
                                    Get.showSnackbar(GetSnackBar(
                                      message: otpState.errorMessage,
                                      duration: Duration(seconds: 2),
                                      isDismissible: true,
                                      backgroundColor: Colors.redAccent,
                                    ));
                                  }
                                }
                              },
                              child: const Text('Next')),
                        );
                      })),
                  const SizedBox(
                    height: 40,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: 'This code will expire in',
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                    TextSpan(
                        text: '  $counter s',
                        style: const TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 19,
                            fontWeight: FontWeight.w500))
                  ])),
                  TextButton(
                      onPressed: () {
                        if (counter == 0) {
                          //Get.to()
                        }
                      },
                      child: Text(
                        'Resend Code',
                        style: counter == 0
                            ? const TextStyle(
                                color: Colors.blueAccent, fontSize: 15)
                            : const TextStyle(color: Colors.grey, fontSize: 15),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void timerSecond() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (counter <= 12 && counter > 0) {
          counter--;
          print(timer.tick);
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }
}
