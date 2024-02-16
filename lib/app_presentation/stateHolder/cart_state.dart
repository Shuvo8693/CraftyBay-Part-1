import 'package:ecommerce_project/app_presentation/stateHolder/product_details_state.dart';
import 'package:get/get.dart';

class CartState extends GetxController{

  Future<String?>getPrice()async{
      var productList = Get.find<ProductDetailsState>().getProductDetailsList;
      if(productList?.productListByRemark?.price!=null){
        return productList?.productListByRemark!.price;
      }else{
        return null;
      }
  }

  List<int> counter=List.filled(5, 0);
   RxInt _totalPrice=0.obs;
  RxInt get totalPrice=>_totalPrice;

 Future <void> incrementCount(int index)async{
   var price= await getPrice();
    counter[index]++;
    _totalPrice.value+= int.parse(price.toString());
   update();

  }
  Future<void> decrementCount(int index) async {
    var price= await getPrice();
    if(counter[index]>0) {
      counter[index]--;
      _totalPrice.value-= int.parse(price.toString());
      update();
    }
  }
}
