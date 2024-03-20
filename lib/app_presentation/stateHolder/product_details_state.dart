import 'dart:developer';

import 'package:ecommerce_project/app_presentation/data/model/product_detail_list.dart';
import 'package:ecommerce_project/app_presentation/data/model/product_details_model.dart';
import 'package:ecommerce_project/app_presentation/data/model/response_data.dart';
import 'package:ecommerce_project/app_presentation/data/service/network_caller.dart';
import 'package:ecommerce_project/app_presentation/data/utility/url.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/cart_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductDetailsState extends GetxController{

  ProductDetailsModel _productDetailsModel=ProductDetailsModel();
  ProductDetailList? get getProductDetailsList=>_productDetailsModel.productDetailList?.first?? ProductDetailList();


  String _errorMessage='';
  String get errorMessage =>_errorMessage;

  bool? _isData;
  bool? get isData=>_isData;

  bool _inProgress=false;
  bool get inProgress=>_inProgress;

  Future<bool> getProductDetails({required int productID})async{
    _inProgress=true;
    update();
    ResponseData response= await NetworkCaller().getRequest(Urls.productDetailsUrl(productID));
    _inProgress=false;
    if(response.isSuccess){
      if( (response.responseData["data"] as List).isEmpty ){
        initializeQty(response);
        initializerTotalPrice(response);
        _isData=true;
      }else{
        _productDetailsModel = ProductDetailsModel.fromJson(response.responseData);
       // Get.find<CartState>().totalPrice=ValueNotifier(getProductDetailsList?.productListByRemark?.unitPrice??0);
      initializeQty(response);
       initializerTotalPrice(response);
        _isData=false;
      }
      update();
     return true;
    }else{
      _errorMessage=response.message;
      log(_errorMessage);
      update();
    }
    return false;

  }
 ValueNotifier initializerTotalPrice(ResponseData response){
    if((response.responseData['data'] as List).isEmpty){
     return Get.find<CartState>().totalPrice=ValueNotifier(0);
    }else{
      Get.find<CartState>().totalPrice= _productDetailsModel.productDetailList?.map((element){
        return ValueNotifier(element.productListByRemark?.unitPrice??0);
      } ).first;
    }
   return ValueNotifier(0);
  }

 List<int> initializeQty(ResponseData response){
    if((response.responseData['data'] as List).isEmpty){
      return Get.find<CartState>().counter=List.generate(5, (index) => 0);
    }
    return Get.find<CartState>().counter=List.generate(20, (index) => 1);
  }
}