import 'package:ecommerce_project/app_presentation/stateHolder/cart_list_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/cart_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/create_cartlist_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/product_details_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/auth/verify_email_screen.dart';
import '../utilities/app_colors.dart';

class CartCheckout extends StatefulWidget {
  const CartCheckout({
    super.key, required this.textEB, required this.color1, required this.size1, required this.index,
  });


  final String textEB;
  final String? color1;
  final String? size1;
  final int index;

  @override
  State<CartCheckout> createState() => _CartCheckoutState();
}

class _CartCheckoutState extends State<CartCheckout> {
    late CartState cartState2;
@override
  void initState() {
    super.initState();
    cartState2=Get.find<CartState>();
  }


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
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 8, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Total Price'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder(
                      valueListenable: cartState2.totalPrice??ValueNotifier(0),
                      builder: (BuildContext context, totalPrice, __) {
                      return Text('\$$totalPrice',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),);}
                    ),
                GetBuilder<CreateCartListState>(
                 builder: (createCartListState) {
                   return ElevatedButton(
                      onPressed: () async {
                        if (widget.color1 != null && widget.size1 != null ) {
                          final productDetails =
                              Get.find<ProductDetailsState>().getProductDetailsList;
                          final productId = productDetails?.productId ?? 0;
                          final cartState = Get.find<CartState>();
                          final qty = cartState.counter![widget.index];

                          if (productDetails != null) {
                            bool result = await createCartListState.createCartItem(
                                productID: productId,
                                color: widget.color1 ?? '',
                                size: widget.size1 ?? '',
                                qty: qty);

                            if (result) {
                            await Get.find<CartListState>().updateQuantity(productId, qty);
                              Get.showSnackbar(GetSnackBar(
                                title: createCartListState.errorMessage,
                                message: 'Add to cart Completed',
                                isDismissible: true,
                                duration: Duration(seconds: 2),
                              ));
                            } else {
                              Get.off(VerifyEmailScreen());
                            }
                          } else {
                            Get.showSnackbar(GetSnackBar(
                                title: 'Failed',
                                message: ' Not Completed Add to cart',
                                isDismissible: true,
                                duration: Duration(seconds: 2)));
                          }
                        } else {
                          Get.showSnackbar(const GetSnackBar(
                            title: 'Failed',
                            message: 'Add to cart failed',
                            isDismissible: true,
                            duration: Duration(seconds: 2),
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(widget.textEB),
                    );
                 }
               )
              ],
            )
          ],
        ),
      ),
    );
  }
}