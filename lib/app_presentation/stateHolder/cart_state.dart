
import 'package:ecommerce_project/app_presentation/stateHolder/product_details_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartState extends GetxController{

  List<int>? counter;
  ValueNotifier<int>?  totalPrice;
  bool inProgress=false;

  Future<String?> getPrice() async {
    var productList = Get.find<ProductDetailsState>().getProductDetailsList;
    productList?.productListByRemark?.price;
    if (productList?.productListByRemark?.price != null) {
      return productList?.productListByRemark!.price;
    } else {
      return null;
    }
  }

  init(int index)async{
     final price= await getPrice();
     int total=0;
     final productPrice =  price !=null? int.parse(price): 0;
     total = productPrice * (counter?[index]??0);
     totalPrice?.value = total ;
  }

   Future<void>initialize({int? index})async{
     await init(index??0);
   }


 Future <void> incrementCount(int index)async{
    await init(index);
   var price= await getPrice();
    counter![index]++;
    totalPrice?.value += int.tryParse(price??'')??0;
   update();

  }
  Future<void> decrementCount(int index) async {
     await init(index);
    var price= await getPrice();
    if(counter![index]>1) {
      counter![index]--;
      totalPrice?.value-= int.tryParse(price??'')??0;
      update();
    }
  }
}

