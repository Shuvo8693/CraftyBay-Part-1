import 'dart:developer';

import 'package:ecommerce_project/app_presentation/data/service/network_caller.dart';
import 'package:ecommerce_project/app_presentation/data/utility/url.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/auth_controller.dart';
import 'package:get/get.dart';

class CreateReviewState extends GetxController {
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
 bool _inProgress=false;
 bool get inProgress=> _inProgress;
  Future<bool> postCreateReview(
      {required String description,
      required int productId,
      required String rating}) async {

    _inProgress=true;
    update();

    Map<String, dynamic> bodyParam = {
      "description": description,
      "product_id": productId,
      "rating": int.parse(rating)
    };
    await Get.find<AuthController>().tokenInitialization();
    final token=Get.find<AuthController>().varToken;

    final response = await NetworkCaller().postRequest(Urls.createReviewUrl,
        bodyParam, token.toString() );
    _inProgress=false;
    if (response.isSuccess) {
      log(response.isSuccess.toString());
      update();
      return true;
    } else {
      _errorMessage = response.message;
      log(_errorMessage);
      return false;
    }
  }
}
