import 'package:flutter/material.dart';
import '../widgets/app_logo.dart';

class SignUpProfileScreen extends StatefulWidget {
  const SignUpProfileScreen({super.key});

  @override
  State<SignUpProfileScreen> createState() => _SignUpProfileScreenState();
}

class _SignUpProfileScreenState extends State<SignUpProfileScreen> {

  final TextEditingController _firstNameTEC=TextEditingController();
  final TextEditingController _lastNameTEC=TextEditingController();
  final TextEditingController _mobileNameTEC=TextEditingController();
  final TextEditingController _cityNameTEC=TextEditingController();
  final TextEditingController _addressNameTEC=TextEditingController();
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
                    controller: _firstNameTEC,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'First name',
                    ),
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: _lastNameTEC,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'Last name'
                    ),
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: _mobileNameTEC,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'Mobile'
                    ),
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: _cityNameTEC,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'City'
                    ),
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: _addressNameTEC,
                    maxLines: 4,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: 'Shipping Address'
                    ),
                  ),
                  const SizedBox(height: 18,),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: (){

                          }, child: const Text('Completed'))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
