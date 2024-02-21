import 'dart:developer';

import 'package:ecommerce_project/app_presentation/data/model/review_list_model.dart';
import 'package:ecommerce_project/app_presentation/data/service/network_caller.dart';
import 'package:ecommerce_project/app_presentation/data/utility/url.dart';
import 'package:get/get.dart';

class ReviewListState extends GetxController{
  ReviewListModel _reviewListModel= ReviewListModel();
  ReviewListModel get reviewListModel => _reviewListModel;


  String _errorMessage='';
  String get errorMessage =>_errorMessage;

  Future<bool> getReviewList(int productID)async{
    final response= await NetworkCaller().getRequest(Urls.reviewListUrl(productID));
    if(response.isSuccess){
      _reviewListModel = ReviewListModel.fromJson(response.responseData);
      update();
      return true;
    }else{
      _errorMessage=response.message;
      log(_errorMessage);
      return false;
    }
  }
}