import 'package:ecommerce_project/app_presentation/data/model/create_profile.dart';
import 'package:ecommerce_project/app_presentation/data/model/create_profile_param.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/otp_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/signup_profile_state.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_logo.dart';

class SignUpProfileScreen extends StatefulWidget {
  const SignUpProfileScreen({super.key});

  @override
  State<SignUpProfileScreen> createState() => _SignUpProfileScreenState();
}

class _SignUpProfileScreenState extends State<SignUpProfileScreen> {

  final TextEditingController _cusNameTEC=TextEditingController();
  final TextEditingController _cusAddTEC=TextEditingController();
  final TextEditingController _cusCityTEC=TextEditingController();
  final TextEditingController _cusStateTEC=TextEditingController();
  final TextEditingController _cusPostCodeTEC=TextEditingController();
  final TextEditingController _cusCountryTEC=TextEditingController();
  final TextEditingController _cusPhoneTEC=TextEditingController();
  final TextEditingController _cusFaxTEC=TextEditingController();
  final TextEditingController _shipNameTEC=TextEditingController();
  final TextEditingController _shipAddTEC=TextEditingController();
  final TextEditingController _shipCityTEC=TextEditingController();
  final TextEditingController _shipStateTEC=TextEditingController();
  final TextEditingController _shipPostcodeTEC=TextEditingController();
  final TextEditingController _shipCountryTEC=TextEditingController();
  final TextEditingController _shipPhoneTEC=TextEditingController();
  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();

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
                  const AppLogo(height: 110,),
                  const SizedBox(height: 15,),
                  Text('Complete Profile',style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 33)),
                  const SizedBox(height: 5,),
                  const Text('Get started with us with your details',style: TextStyle(color: Colors.grey,fontSize: 15)),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _cusNameTEC,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'Customer Name',
                    ),
                    validator: (String? value){
                      if(value!.isEmpty==true){
                        return'Enter Your Name';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: _cusCityTEC,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'Customer City'
                    ),
                    validator: (String? value){
                      if(value!.isEmpty==true){
                        return'Enter Your city';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: _cusStateTEC,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'Customer State'
                    ),
                    validator: (String? value){
                      if(value!.isEmpty==true){
                        return'Enter Your State';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: _cusAddTEC,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'Customer Address'
                    ),
                    validator: (String? value){
                      if(value!.isEmpty==true){
                        return'Enter Your Address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: _cusPostCodeTEC,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'Post Code'
                    ),
                    validator: (String? value){
                      if(value!.isEmpty==true){
                        return'Enter Your Post Code';
                      }
                      return null;
                    },
                  ), const SizedBox(height: 15,),

                  TextFormField(
                    controller: _cusCountryTEC,
                    maxLines: 1,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'Customer Country'
                    ),
                    validator: (String? value){
                      if(value!.isEmpty==true){
                        return'Enter Your Country';
                      }
                      return null;
                    },
                  ), const SizedBox(height: 15,),
                  TextFormField(
                    controller: _cusPhoneTEC,
                    maxLines: 1,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'Customer Phone'
                    ),
                    validator: (String? value){
                      if(value!.isEmpty==true){
                        return'Enter Your Phone';
                      }
                      return null;
                    },
                  ), const SizedBox(height: 15,),
                  TextFormField(
                    controller: _cusFaxTEC,
                    maxLines: 1,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'Customer Fax'
                    ),
                    validator: (String? value){
                      if(value!.isEmpty==true){
                        return'Enter Your Fax';
                      }
                      return null;
                    },
                  ), const SizedBox(height: 15,),
                  TextFormField(
                    controller: _shipNameTEC,
                    maxLines: 1,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'Shipping Name'
                    ),
                    validator: (String? value){
                      if(value!.isEmpty==true){
                        return'Enter Shipping Name';
                      }
                      return null;
                    },
                  ), const SizedBox(height: 15,),
                  TextFormField(
                    controller: _shipAddTEC,
                    maxLines: 2,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'Shipping Address'
                    ),
                    validator: (String? value){
                      if(value!.isEmpty==true){
                        return'Enter Your Shipping Address';
                      }
                      return null;
                    },
                  ), const SizedBox(height: 15,),
                  TextFormField(
                    controller: _shipCityTEC,
                    maxLines: 1,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'Shipping City'
                    ),
                    validator: (String? value){
                      if(value!.isEmpty==true){
                        return'Enter Your Shipping City';
                      }
                      return null;
                    },
                  ), const SizedBox(height: 15,),
                  TextFormField(
                    controller: _shipStateTEC,
                    maxLines: 1,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'Shipping State'
                    ),
                    validator: (String? value){
                      if(value!.isEmpty==true){
                        return'Enter Your Shipping State';
                      }
                      return null;
                    },
                  ), const SizedBox(height: 15,),
                  TextFormField(
                    controller: _shipPostcodeTEC,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'Shipping Post Code'
                    ),
                    validator: (String? value){
                      if(value!.isEmpty==true){
                        return'Enter Your Shipping Post Code';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: _shipCountryTEC,
                    maxLines: 1,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'Shipping Country'
                    ),
                    validator: (String? value){
                      if(value!.isEmpty==true){
                        return'Enter Your Shipping Country';
                      }
                      return null;
                    },
                  ), const SizedBox(height: 15,),
                  TextFormField(
                    controller: _shipPhoneTEC,
                    maxLines: 1,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'Shipping Phone'
                    ),
                    validator: (String? value){
                      if(value!.isEmpty==true){
                        return'Enter Your Shipping Phone';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 18,),
                  SizedBox(
                      width: double.infinity,
                      child: GetBuilder<SignUpProfileState>(
                        builder: (signUpProfileState) {
                          return Visibility(
                             visible: signUpProfileState.inProgress==false,
                            replacement: const Center(child: CircularProgressIndicator(),),
                            child: ElevatedButton(
                                onPressed: ()async{
                                if(_formKey.currentState!.validate()){
                               final bool result= await signUpProfileState.signUpProfile(
                                   CreateProfile(
                                              cusName: _cusNameTEC.text,
                                              cusAdd: _cusAddTEC.text,
                                              cusCity: _cusCityTEC.text,
                                              cusState: _cusStateTEC.text,
                                              cusPostcode: _cusPostCodeTEC.text,
                                              cusCountry: _cusCountryTEC.text,
                                              cusPhone: _cusPhoneTEC.text,
                                              cusFax: _cusFaxTEC.text,
                                              shipName: _shipNameTEC.text,
                                              shipAdd: _shipAddTEC.text,
                                              shipCity: _shipCityTEC.text,
                                              shipState: _shipStateTEC.text,
                                              shipPostcode: _shipPostcodeTEC.text,
                                              shipCountry: _shipCountryTEC.text,
                                              shipPhone: _shipPhoneTEC.text),
                                          Get.find<OtpState>().token);
                                  if(result){
                                    Get.to(()=> BottomNavBarScreen());
                                  }else{
                                    Get.showSnackbar(GetSnackBar(
                                      title: 'Failed',
                                      message: signUpProfileState.errorMessage,
                                      isDismissible: true,
                                      backgroundColor: Colors.redAccent,
                                    ));
                                  }
                                }
                                }, child: const Text('Completed')),
                          );
                        }
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _cusNameTEC.dispose();
    _cusAddTEC.dispose();
    _cusCityTEC.dispose();
    _cusStateTEC.dispose();
    _cusPostCodeTEC.dispose();
    _cusCountryTEC.dispose();
    _cusPhoneTEC.dispose();
    _cusFaxTEC.dispose();
    _shipNameTEC.dispose();
    _shipAddTEC.dispose();
    _shipCityTEC.dispose();
    _shipStateTEC.dispose();
    _shipPostcodeTEC.dispose();
    _shipCountryTEC.dispose();
    _shipPhoneTEC.dispose();
  }
}
