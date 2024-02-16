import 'dart:developer';

import 'package:ecommerce_project/app_presentation/data/service/network_caller.dart';
import 'package:ecommerce_project/app_presentation/data/utility/url.dart';
import 'package:get/get.dart';

import '../data/model/product_list_remark.dart';

class ProductByRemarkState extends GetxController{

  ProductRemark _popularProductRemark = ProductRemark();
  ProductRemark _specialProductRemark = ProductRemark();
  ProductRemark _newProductRemark = ProductRemark();
  ProductRemark get popularProductRemark => _popularProductRemark;
  ProductRemark get specialProductRemark => _specialProductRemark;
  ProductRemark get newProductRemark => _newProductRemark;

  String _popularErrorMessage='';
  String _specialErrorMessage='';
  String _newErrorMessage='';
  String get popularErrorMessage=> _popularErrorMessage;
  String get specialErrorMessage=> _specialErrorMessage;
  String get newErrorMessage=> _newErrorMessage;

  Future<bool>popularProduct()async{
    final response= await NetworkCaller().getRequest(Urls.popularProductListUrl);
    if(response.isSuccess){
     final getResponseData=response.responseData;
    _popularProductRemark =ProductRemark.fromJson(getResponseData);
     update();
    return true;
    }else{
     _popularErrorMessage=response.message;
     log(_popularErrorMessage);
    }
    return response.isSuccess;
  }

  Future<bool>specialProduct()async{
    final response= await NetworkCaller().getRequest(Urls.specialProductListUrl);
    if(response.isSuccess){
     final getResponseData=response.responseData;
     _specialProductRemark =ProductRemark.fromJson(getResponseData);
     update();
    return true;
    }else{
      _specialErrorMessage=response.message;
     log(_specialErrorMessage);
    }
    return response.isSuccess;
  }

  Future<bool>newProduct()async{
    final response= await NetworkCaller().getRequest(Urls.newProductListUrl);
    if(response.isSuccess){
     final getResponseData=response.responseData;
     _newProductRemark =ProductRemark.fromJson(getResponseData);
     update();
    return true;
    }else{
      _newErrorMessage=response.message;
     log(_newErrorMessage);
    }
    return response.isSuccess;
  }
}