import 'dart:developer';
import 'package:ecommerce_project/app_presentation/data/model/create_wishlist_model.dart';
import 'package:ecommerce_project/app_presentation/data/utility/url.dart';
import 'package:get/get.dart';
import '../data/service/network_caller.dart';
import 'auth_controller.dart';

class CreateAndRemoveWishListState extends GetxController{

  CreateWishListItem _createWishListItem=CreateWishListItem();
  CreateWishListItem get createWishListItem=>_createWishListItem;

  String _message='';
  String get message =>_message;

  Future <bool> getToCreateWishList(int productID)async{
    await Get.find<AuthController>().tokenInitialization();
    final token =Get.find<AuthController>().varToken;
    final response = await NetworkCaller().getRequest(Urls.createWishListUrl(productID),token: token );
    if(response.isSuccess){
      _createWishListItem= CreateWishListItem.fromJson(response.responseData['data']);
      update();
      return true;
    }else{
      _message=response.message;
      log(_message);
      update();
      return false;
    }
  }

  Future <bool> getToRemoveWishList(int productID)async{
    await Get.find<AuthController>().tokenInitialization();
    final token =Get.find<AuthController>().varToken;
    final response = await NetworkCaller().getRequest(Urls.removeWishListUrl(productID),token: token );
    if(response.isSuccess){
      _message=response.responseData['data'].toString();
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