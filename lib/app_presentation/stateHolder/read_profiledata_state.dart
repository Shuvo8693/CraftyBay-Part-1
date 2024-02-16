import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/service/network_caller.dart';
import '../data/utility/url.dart';

class ReadProfileState extends GetxController{

  bool _isProfileData=false;
  bool get isProfileData=>_isProfileData;

  String _errorMessage='';
  String get errorMessage=>_errorMessage;



  Future <bool> readProfile(String token)async{
    final response= await NetworkCaller().getRequest(Urls.readProfileUrl,token: token);
    if(response.isSuccess){
     var profileData= response.responseData['data'];
      print('ProfileData: $profileData');
      if(  profileData != null){        //profileData is List && profileData.isNotEmpty  --> [{}]
        _isProfileData=true;
      //  _profile=Profile.fromJson(profileData[0]);  //at backend this [0] is for first element of index in 'data':[{key:value}]
      }else{
        _isProfileData=false;
      }
      update();
      return true;
    }else{
      _errorMessage=response.message;
    }
    return false;
  }
}