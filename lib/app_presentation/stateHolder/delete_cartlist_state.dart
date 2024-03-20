import 'dart:developer';

import 'package:ecommerce_project/app_presentation/data/service/network_caller.dart';
import 'package:ecommerce_project/app_presentation/data/utility/url.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/auth_controller.dart';
import 'package:get/get.dart';

class DeleteCartListState extends GetxController{
  bool _inProgress=false;
  bool get inProgress=>_inProgress;

  String _message='';
  String get message=>_message;

  Future <bool> getToDeleteCartList(int productID)async{
    await Get.find<AuthController>().tokenInitialization();
    final token = Get.find<AuthController>().varToken;
    _inProgress=true;
    update();
    final response =await NetworkCaller().getRequest(Urls.deleteCartListUrl(productID),token: token );
    if(response.isSuccess){
       if(response.responseData['data']==1){
       _message= response.responseData['data'].toString();
       }
       _inProgress=false;
       update();
      return true;
    }else{
      _message=response.message;
      log(_message);
      update();
      return false;
    }
  }
}