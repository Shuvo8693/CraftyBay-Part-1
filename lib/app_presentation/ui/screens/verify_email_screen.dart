import 'package:ecommerce_project/app_presentation/ui/screens/pin_verify_screen.dart';
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
                 TextFormField(
                   controller: _emailTEC,
                   keyboardType: TextInputType.emailAddress,
                   decoration: const InputDecoration(
                     hintText: 'Email Address'
                   ),
                 ),
                 const SizedBox(height: 18,),
                 SizedBox(
                   width: double.infinity,
                     child: ElevatedButton(
                         onPressed: (){
                           Get.to(const PinVerifyScreen());
                         }, child: const Text('Next'))),
               ],
             ),
           ),
         ),
       ),
    );
  }
}
