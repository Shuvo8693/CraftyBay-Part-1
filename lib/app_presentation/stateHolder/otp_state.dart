import 'package:ecommerce_project/app_presentation/data/service/network_caller.dart';
import 'package:ecommerce_project/app_presentation/data/utility/url.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/auth_controller.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/read_profiledata_state.dart';
import 'package:get/get.dart';

class OtpState extends GetxController{
  bool _inProgress=false;
  bool get inProgress=>_inProgress;

  String _token='';
  String get token=>_token;

  String _errorMessage='';
  String get errorMessage=>_errorMessage;

  bool _shouldINavigateCompleteProfile=true;
  bool get shouldINavigateCompleteProfile=>_shouldINavigateCompleteProfile;



  Future <bool> verifyOtpState(String email,String otp)async{
    _inProgress=true;
    update();
    final response= await NetworkCaller().getRequest(Urls.verifyOtpUrl(email,otp));
    _inProgress=false;
    update();
    if(response.isSuccess){

      _token= response.responseData['data'];
      await Future.delayed(Duration(seconds: 4)); // readProfile er request er jonno wait korta hobe ta na hola readProfile unauthorized ashbe
     var result =await Get.find<ReadProfileState>().readProfile(_token);
      if(result){
        _shouldINavigateCompleteProfile=Get.find<ReadProfileState>().isProfileData==false;
        if(_shouldINavigateCompleteProfile==false){
          Get.find<AuthController>().saveUserInfo( profile: null, token: _token, );
        }
      }else{
        _errorMessage=Get.find<ReadProfileState>().errorMessage;
      }
      return true;
    }else{
      _errorMessage=response.message;
      return false;
    }
  }
}