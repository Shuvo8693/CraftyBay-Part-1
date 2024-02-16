
import 'package:ecommerce_project/app_presentation/stateHolder/show_appbar_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../stateHolder/bottom_nav_state.dart';
import '../../stateHolder/cart_state.dart';
import '../widgets/cart_checkout.dart';
import '../widgets/cart_list_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, this.isSelected = false});

  final bool isSelected;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartState cartState=Get.find<CartState>();

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
              child: ListView.builder(
                  itemCount: cartState.counter.length,
                  itemBuilder: (context, index) {
                     return  CartListItem(index: index,);
                  }),
            ),
            GetBuilder<CartState>(
              builder: (context) {
                return CartCheckout(
                  textEB: 'CheckOut',
                 // text: '\$${cartState.totalPrice}',
                  onPressed: () {  },
                );
              }
            )
          ],
        ));
  }

}



