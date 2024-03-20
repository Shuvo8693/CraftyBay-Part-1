import 'dart:developer';
import 'package:ecommerce_project/app_presentation/data/model/invoice_model.dart';
import 'package:ecommerce_project/app_presentation/data/service/network_caller.dart';
import 'package:ecommerce_project/app_presentation/data/utility/url.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/auth_controller.dart';
import 'package:get/get.dart';

class InvoiceState extends GetxController{
   InvoiceModel _invoiceModel=InvoiceModel();
   PaymentSummery? get invoiceModel=>_invoiceModel.paymentSummery?.first??PaymentSummery();

   String _errorMessage='';
   String get errorMessage=>_errorMessage;

   bool _inProgress=false;
   bool get inProgress=>_inProgress;

  Future <bool> getInvoice()async{
    await Get.find<AuthController>().tokenInitialization();
    final token= Get.find<AuthController>().varToken;
    _inProgress=true;
    update();
    final response= await NetworkCaller().getRequest(Urls.invoiceUrl,token:token);
    if(response.isSuccess){
      _invoiceModel= InvoiceModel.fromJson(response.responseData);
      _inProgress=false;
      update();
      return true;
    }else{
      _errorMessage=response.message;
      log(_errorMessage);
      update();
      return false;
    }
  }
}