
import 'package:ecommerce_project/app_presentation/data/model/cart_list_model.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/cart_list_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/show_appbar_state.dart';
import 'package:ecommerce_project/app_presentation/ui/widgets/cart_list_checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../stateHolder/bottom_nav_state.dart';
import '../widgets/cart_list_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, this.isSelected = false});

  final bool isSelected;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  CartListState cartListState=Get.find<CartListState>() ;
  CartListModel cartListModel = CartListModel();
  int index1=0;

  @override
  void initState() {
    super.initState();
      Get.find<CartListState>().getCartList();
      cartListState.totalPrice = cartListState.calculateTotalPrice.obs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.isSelected == true
            ? Get.find<ShowAppBar>().appData(context)
            : AppBar(
                leading: Builder(builder: (context) {
                  return IconButton(
                    onPressed: () {
                      Get.find<BottomNavState>().backHome();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  );
                }),
                title: const Text('Cart'),
              ),
        body: Column(
          children: [
            Expanded(
              child: GetBuilder<CartListState>(
                builder: (cartListState) {
                  return ListView.builder(
                      itemCount: cartListState.cartListModel.cartListItem?.length??0,
                      itemBuilder: (context, index) {
                        return  CartItem(index: index,
                             cartListItem: cartListState.cartListModel.cartListItem![index],
                          cartListState: cartListState,
                          initialQty: cartListState.cartListModel.cartListItem![index].qty,);
                      });
                }
              ),
            ),
            CartListCheckout(),
          ],
        ));
  }

}



