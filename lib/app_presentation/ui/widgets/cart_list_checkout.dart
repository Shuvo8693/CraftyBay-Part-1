import 'package:ecommerce_project/app_presentation/stateHolder/cart_list_state.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/invoice_sccreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/app_colors.dart';

class CartListCheckout extends StatefulWidget {
  const CartListCheckout({
    super.key,
  });
  @override
  State<CartListCheckout> createState() => _CartCheckoutState();
}

class _CartCheckoutState extends State<CartListCheckout> {
  CartListState cartListState=Get.find<CartListState>();


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                const Text('Total Price',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
                const SizedBox(height: 5,),
               Obx(() => Text('\$${cartListState.totalPrice}',
                 style: const TextStyle(
                     fontSize: 16, fontWeight: FontWeight.bold),),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ElevatedButton(
               onPressed: () {
                 Get.to(()=> InvoiceScreen());
               },
               style: ElevatedButton.styleFrom(
                   shape: BeveledRectangleBorder(
                       borderRadius: BorderRadius.circular(10))),
               child: const Text('CheckOut'),
             ),
          )
        ],
      ),
    );
  }
}