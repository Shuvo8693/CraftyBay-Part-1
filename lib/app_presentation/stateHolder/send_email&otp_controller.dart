import 'dart:developer';

import 'package:ecommerce_project/app_presentation/data/utility/url.dart';
import 'package:get/get.dart';

import '../data/service/network_caller.dart';

class SendEmailAndOtpController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<bool> sendEmail(email) async {
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.userUrl(email));
    _inProgress = false;
    update();
    log(response.message);
    if (response.isSuccess) {
      update();
      return true;
    } else {
      _errorMessage = response.message;
      update();
      return false;
    }
  }
}
