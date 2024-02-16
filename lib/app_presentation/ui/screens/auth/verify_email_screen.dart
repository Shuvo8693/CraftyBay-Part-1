import 'dart:ffi';

import 'package:ecommerce_project/app_presentation/stateHolder/send_email&otp_controller.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/auth/pin_verify_screen.dart';
import 'package:ecommerce_project/app_presentation/ui/utilities/app_colors.dart';
import 'package:ecommerce_project/app_presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {

  final TextEditingController _emailTEC=TextEditingController();
  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
  ValueNotifier<Color?>emailBorderColor= ValueNotifier(null);
 // Color? emailBorderColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child: Padding(
           padding: const EdgeInsets.all(15.0),
           child: Form(
               key: _formKey,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const AppLogo(height: 110,),
                   const SizedBox(height: 30,),
                   Text('Welcome Back',style: Theme.of(context).textTheme.displayLarge),
                   const SizedBox(height: 5,),
                   const Text('Please enter your email Address',style: TextStyle(color: Colors.grey,fontSize: 15)),
                   const SizedBox(height: 20,),
                   ValueListenableBuilder(
                     valueListenable: emailBorderColor,
                     builder: (BuildContext context, colorValue, Widget? child) {
                      return TextFormField(
                       controller: _emailTEC,
                       keyboardType: TextInputType.emailAddress,
                       decoration:  InputDecoration(
                         hintText: 'Email Address',
                         enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: colorValue?? AppColors.primaryColor,width: 1.0)),
                         disabledBorder:OutlineInputBorder(borderSide: BorderSide(color: colorValue?? AppColors.primaryColor,width: 1.0)) ,
                         focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: colorValue?? AppColors.primaryColor,width: 1.0)) ,
                         border: OutlineInputBorder(borderSide: BorderSide(color: colorValue?? AppColors.primaryColor,width: 1.0))
                       ),
                       validator: emailValidator,
                       onChanged: (value){
                         setState(() {
                           if (emailValidator(value)==null){
                             emailBorderColor.value=Colors.green;
                           }else{
                             emailBorderColor.value=Colors.redAccent;
                           }
                         });
                       },
                     );
                     },
                   ),
                   const SizedBox(height: 18,),
                   GetBuilder<SendEmailAndOtpController>(
                     builder: (controller) {
                       return SizedBox(
                         width: double.infinity,
                           child: Visibility(
                             visible: controller.inProgress==false,
                             replacement: const Center(child: CircularProgressIndicator(),),
                             child: ElevatedButton(
                                 onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  final bool result = await controller
                                      .sendEmail(_emailTEC.text.trim());
                                  // result true tokhoni hobe jokhon sendEmail e network response isSuccess true hobe.
                                  if (result) {
                                    Get.to(() => PinVerifyScreen(email:_emailTEC.text.trim(),));
                                  } else {
                                    Get.showSnackbar( GetSnackBar(
                                      message: controller.errorMessage,
                                      isDismissible: true,
                                      duration: const Duration(seconds: 3),
                                      backgroundColor: Colors.redAccent,
                                      borderRadius: 7,
                                    ));
                                  }
                                }
                                return;
                              },
                              child: const Text('Next')),
                        ));
                  }),
                 ],
               ),
             ),

         ),
       ),
    );
  }
  String? emailValidator(String? value){
    const pattern=r"^[A-Za-z0-9\.]+[@]+[a-z]+\.[a-z]{2,3}$";
    RegExp regExp=RegExp(pattern);
   // value empty hoy || regExp value match na kore tahole "Enter a valid mail" show korbe,
    // Ar jodi value notEmpty hoy & regExp match hoy tahole null return korbe emailValidator()
   return value!.isEmpty || !regExp.hasMatch(value) ? 'Enter a valid Email Address' : null;
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEC.dispose();
  }
}
