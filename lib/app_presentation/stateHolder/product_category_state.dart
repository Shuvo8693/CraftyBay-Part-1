import 'dart:developer';

import 'package:ecommerce_project/app_presentation/data/model/product_list_remark.dart';
import 'package:ecommerce_project/app_presentation/data/service/network_caller.dart';
import 'package:ecommerce_project/app_presentation/data/utility/url.dart';
import 'package:get/get.dart';

class ProductCategoryState extends GetxController {
  ProductRemark _productRemark=ProductRemark();
  ProductRemark get productRemark=>_productRemark;

  bool _inProgress=false;
  bool get inProgress => _inProgress;

  String _errorMessage='';
  String get errorMessage =>_errorMessage;

  Future<bool> getProductCategory({required int categoryId}) async {

    final response = await NetworkCaller().getRequest(Urls.productCategoryUrl(categoryId));

    if(response.isSuccess){
     _productRemark = ProductRemark.fromJson(response.responseData);
      update();
     return true;
    }else{
    _errorMessage = response.message;
    log(_errorMessage);
    update();
    return false;
    }

  }
}