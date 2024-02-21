import 'package:ecommerce_project/app_presentation/stateHolder/product_details_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartState extends GetxController{



  List<int> counter=List.generate(2, (index) => 1);
  late ValueNotifier<int>  _totalPrice;
  ValueNotifier<int> get totalPrice=>_totalPrice;
   int total=0;
   bool inProgress=false;

  @override
  void onInit()async{
    super.onInit();
    _totalPrice=ValueNotifier(0);

  }
  Future<String?> getPrice() async {
    var productList = Get.find<ProductDetailsState>().getProductDetailsList;
    await productList?.productListByRemark?.price;
    if (productList?.productListByRemark?.price != null) {
      return productList?.productListByRemark!.price;
    } else {
      return null;
    }
  }


  init(int index)async{
     final price= await getPrice();
     final productPrice =  price !=null? int.parse(price): 0;
     total = productPrice * counter[index];
     _totalPrice.value = total ;

   }
   Future<void>initialize({int? index})async{
     await init(index??0);
   }


 Future <void> incrementCount(int index)async{
    await init(index);
   var price= await getPrice();
    counter[index]++;
    _totalPrice.value += int.parse(price.toString());
   update();

  }
  Future<void> decrementCount(int index) async {
     await init(index);
    var price= await getPrice();
    if(counter[index]>1) {
      counter[index]--;
      _totalPrice.value-= int.parse(price.toString());
      update();
    }
  }
}

