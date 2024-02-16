import 'dart:convert';
import 'package:ecommerce_project/app_presentation/data/model/read_profile.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  String? varToken;
  Profile? varProfile;

  Future<void> saveUserInfo({required String? token, required Profile? profile}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token!);
    await sharedPreferences.setString('profile', jsonEncode(profile?.toJson()));
   }

  Future<bool> isLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString('token');
    return token != null;
  }

  Future<void>initialization()async{
    varToken= await _getUserToken();
    varProfile= await _getUserProfile();
  }

  Future<void>tokenInitialization()async{
    varToken= await _getUserToken();
  }

    Future<String?> _getUserToken() async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.getString('token');
    }

    Future<Profile?> _getUserProfile() async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      final String? strProfile = sharedPreferences.getString('profile');

      if (strProfile == null) {
        return null;
      } else {
        return Profile.fromJson(jsonDecode(strProfile));
      }
    }
  Future<bool>clearAuthData()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   final result = await sharedPreferences.clear();
    if(result){
      return true;
    }
    return false;
  }
}
