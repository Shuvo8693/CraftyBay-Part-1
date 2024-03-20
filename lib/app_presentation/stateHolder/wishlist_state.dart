import 'dart:developer';

import 'package:ecommerce_project/app_presentation/data/model/product_wishlist_model.dart';
import 'package:ecommerce_project/app_presentation/data/model/wish_list_item.dart';
import 'package:ecommerce_project/app_presentation/data/service/network_caller.dart';
import 'package:ecommerce_project/app_presentation/data/utility/url.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/auth_controller.dart';
import 'package:get/get.dart';

class WishListState extends GetxController{

 ProductWishListModel _productWishListModel=ProductWishListModel();
 ProductWishListModel get productWishListModel=>_productWishListModel;
 WishListItem get wishListItemModel=>_productWishListModel.wishListItem?.first??WishListItem();
 String _errorMessage='';
 String get errorMessage =>_errorMessage;
 int? productID;

  Future <bool> getWishList()async{
  await Get.find<AuthController>().tokenInitialization();
   final token =Get.find<AuthController>().varToken;
    final response = await NetworkCaller().getRequest(Urls.productWishListUrl,token: token );
    if(response.isSuccess){
      _productWishListModel= ProductWishListModel.fromJson(response.responseData);
      updateWishLogo();
      update();
      return true;
    }else{
      _errorMessage=response.message;
      log(_errorMessage);
      update();
      return false;
    }
  }
 int updateWishLogo(){
   return productID =_productWishListModel.wishListItem?.first.productId??0;
 }
}