import 'dart:developer';

import 'package:ecommerce_project/app_presentation/data/model/all_categorise.dart';
import 'package:ecommerce_project/app_presentation/data/service/network_caller.dart';
import 'package:ecommerce_project/app_presentation/data/utility/url.dart';
import 'package:get/get.dart';

class AllCategoryState extends GetxController{
   bool _inProgress=false;
   bool get inProgress=>_inProgress;

   String _errorMessage = '';
   String get errorMessage => _errorMessage;

    AllCategorise _allCategorise=AllCategorise();
   AllCategorise get allCategorise =>_allCategorise;

  Future<bool> getAllCategory() async {
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.allCategoryUrl);
    _inProgress = false;
    if (response.isSuccess) {
      var getResponseData = response.responseData;
      _allCategorise = AllCategorise.fromJson(getResponseData);
      update();
      return true;
    } else {
      _errorMessage = response.message;
      log(_errorMessage);
    }
    return response.isSuccess;
  }
}