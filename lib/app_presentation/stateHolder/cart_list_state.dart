import 'dart:developer';
import 'package:ecommerce_project/app_presentation/data/model/cart_list_model.dart';
import 'package:ecommerce_project/app_presentation/data/service/network_caller.dart';
import 'package:ecommerce_project/app_presentation/data/utility/url.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartListState extends GetxController{

  CartListModel _cartListModel=CartListModel();
  CartListModel get cartListModel=>_cartListModel;

   late List<ValueNotifier<int>> counter;

    RxDouble?  totalPrice ;

  String _errorMessage='';
  String get errorMessage=>_errorMessage;


@override
  void onInit() {
    super.onInit();
    counter=[];
    //totalPrice=_calculateTotalPrice.obs;
  }

  Future<bool>getCartList()async{
    await Get.find<AuthController>().tokenInitialization();
    final token =Get.find<AuthController>().varToken;
    final response= await NetworkCaller().getRequest(Urls.cartListUrl,token:token );
    if(response.isSuccess){
      _cartListModel= CartListModel.fromJson(response.responseData);
      _initializeCounter();
      totalPrice?.value = calculateTotalPrice;
      update();
      return true;
    }else{
      _errorMessage=response.message;
      log(_errorMessage);
      return false;
    }
  }
  void _initializeCounter(){
    counter = _cartListModel.cartListItem!.map((item){
       return ValueNotifier(item.qty);
    }).toList();
  }

  double get totalValue{
    double total=0;
    for(CartListItem item in _cartListModel.cartListItem??[]){
      total = double.tryParse(item.productListByRemark?.price??'')??0;
    }
    return total;
  }

  void increment(int index){
    counter[index].value++;
    totalPrice?.value+=totalValue;
    update();
  }

  void decrement(int index){
    if(counter[index].value>1){
      counter[index].value--;
      totalPrice?.value-=totalValue;
      update();
    }
  }

 Future <void> updateQuantity(int productId ,int quantity)async{
  // _cartListModel.cartListItem?.firstWhere((element) => element.productId == productId).qty = quantity;
   for(CartListItem cartListItem in _cartListModel.cartListItem??[]){
      if(cartListItem.productId==productId){
        cartListItem.qty=quantity;
        update();
      }
    }
    totalPrice?.value=calculateTotalPrice;
  }

  double get calculateTotalPrice{
    double total=0;
    for(CartListItem item in _cartListModel.cartListItem??[]){
       print(item.qty);
      total += (double.tryParse(item.productListByRemark?.price??'')??0) * item.qty;
    }
    return total;
  }

}