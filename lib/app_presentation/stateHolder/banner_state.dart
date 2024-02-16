import 'dart:developer';
import 'package:ecommerce_project/app_presentation/data/model/banner_list.dart';
import 'package:ecommerce_project/app_presentation/data/service/network_caller.dart';
import 'package:ecommerce_project/app_presentation/data/utility/url.dart';
import 'package:get/get.dart';

class BannerState extends GetxController{

  bool _inProgress=false;
  bool get inProgress => _inProgress;

  String _errorMessage='';
  String get errorMessage =>_errorMessage;

  BannerList _bannerList= BannerList();
 BannerList get bannerList=> _bannerList;

Future<bool>slider()async{
  _inProgress=true;
  update();
  final response=await NetworkCaller().getRequest(Urls.bannerUrl);
  _inProgress=false;
  if(response.isSuccess){
    final getResponseData=response.responseData;
    _bannerList=BannerList.fromJson(getResponseData);
    log(_bannerList.bannerItemList.toString());
    update();
   return response.isSuccess;
  }else{
    _errorMessage=response.message;
    log(_errorMessage);
  }
  return false;
}

}