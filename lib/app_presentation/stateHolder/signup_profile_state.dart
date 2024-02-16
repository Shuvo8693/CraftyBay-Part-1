import 'dart:developer';

import 'package:ecommerce_project/app_presentation/data/model/create_profile.dart';
import 'package:ecommerce_project/app_presentation/data/model/create_profile_param.dart';
import 'package:ecommerce_project/app_presentation/data/service/network_caller.dart';
import 'package:ecommerce_project/app_presentation/data/utility/url.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/auth_controller.dart';
import 'package:get/get.dart';

import '../data/model/read_profile.dart';

class SignUpProfileState extends GetxController{
  bool _inProgress=false;
  bool get inProgress=>_inProgress;

  Profile _profile=Profile();
 // Profile get profile=>_profile;

  String _errorMessage='';
  String get errorMessage=>_errorMessage;

  Future<bool>signUpProfile(CreateProfile createProfile, String token)async{
   /* _inProgress=true;
    update();*/
   final response = await NetworkCaller().postRequest(Urls.createProfileUrl, createProfile.toJson(), token);
   log(Urls.createProfileUrl);
  /*  _inProgress=false;
    update();*/
    if(response.isSuccess){
      final profileData=response.responseData['data'];
       _profile=Profile.fromJson(profileData);
      Get.find<AuthController>().saveUserInfo( profile: _profile, token: token,);
      return true;
    }else{
    _errorMessage=response.message;
    }
    return false;
  }
}