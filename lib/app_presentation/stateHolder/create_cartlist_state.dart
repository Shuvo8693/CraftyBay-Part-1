import 'dart:developer';

import 'package:ecommerce_project/app_presentation/data/service/network_caller.dart';
import 'package:ecommerce_project/app_presentation/data/utility/url.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/auth_controller.dart';
import 'package:get/get.dart';

class CreateCartListState extends GetxController{

  String _errorMessage='';
  String get errorMessage=>_errorMessage;

  Future<bool> createCartItem(
      {required int productID,
      required String color,
      required String size,
      required int? qty}) async {

    Map<String,dynamic>bodyParams={
      "product_id":productID,
      "color":color,
      "size":size,
      "qty":qty};

    await Get.find<AuthController>().tokenInitialization(); // waiting for ready token
     final token= Get.find<AuthController>().varToken;

    final response = await NetworkCaller().postRequest(Urls.createCartListUrl,bodyParams , token.toString());
    if(response.isSuccess){
      _errorMessage=response.message;
      update();
      return true;
    }else{
      _errorMessage=response.message;
      log(_errorMessage);
      return false;
    }
  }
}