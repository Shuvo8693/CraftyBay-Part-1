import 'dart:developer';

import 'package:ecommerce_project/app_presentation/data/model/product_detail_list.dart';
import 'package:ecommerce_project/app_presentation/data/model/product_details_model.dart';
import 'package:ecommerce_project/app_presentation/data/service/network_caller.dart';
import 'package:ecommerce_project/app_presentation/data/utility/url.dart';
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
    final response= await NetworkCaller().getRequest(Urls.productDetailsUrl(productID));
    _inProgress=false;
    if(response.isSuccess){
      if( (response.responseData["data"] as List).isEmpty ){
        _isData=true;
      }else{
        _productDetailsModel = ProductDetailsModel.fromJson(response.responseData);
        _isData=false;
      }
      update();
     return true;
    }else{
      _errorMessage=response.message;
      log(_errorMessage);
      return false;
    }

  }
}