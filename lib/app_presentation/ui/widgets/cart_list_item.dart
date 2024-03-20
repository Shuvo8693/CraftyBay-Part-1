import 'package:ecommerce_project/app_presentation/stateHolder/cart_list_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/delete_cartlist_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/cart_list_model.dart';
import '../utilities/app_colors.dart';
import '../utilities/assets_path.dart';

class CartItem extends StatefulWidget {
 const  CartItem({
    super.key,
    required this.index,
    required this.cartListItem,
    required this.cartListState, required this.initialQty,
  });

 final int index;
 final CartListItem cartListItem;
 final int initialQty;
 final CartListState cartListState;

  @override
  State<CartItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartItem> {

  @override
  Widget build(BuildContext context) {
    String? image=widget.cartListItem.productListByRemark?.image;
    return Card(
      child: Row(
        children: [
         image !=null? Image.network(
            widget.cartListItem.productListByRemark?.image??'',
           width: 115,
           height: 100,
           fit: BoxFit.cover,
          ): Image.asset(AssetsPath.noImagePath,
           width: 115,
           height: 100,
           fit: BoxFit.cover,),
          const SizedBox(
            width: 6,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     SizedBox(
                      width: 205,
                      child: Text(
                        widget.cartListItem.productListByRemark?.title??'',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    GetBuilder<DeleteCartListState>(
                      builder: (deleteCartListState) {
                          return IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () async {
                                bool result = await deleteCartListState
                                    .getToDeleteCartList(
                                    widget.cartListItem.productId ?? 0);
                                if (result) {
                                 await Get.find<CartListState>().getCartList();
                                  Get.showSnackbar(GetSnackBar(
                                    title: 'Remove Success',
                                    message: deleteCartListState.message
                                        .toString(),
                                    duration: const Duration(seconds: 2),
                                    isDismissible: true,
                                  ));

                                } else {
                                  Get.showSnackbar(const GetSnackBar(
                                    title: 'Remove Failed',
                                    message: 'Cart has been removed failed \n > Please Log-in',
                                    duration: Duration(seconds: 2),
                                    isDismissible: true,
                                  ));
                                }
                              },
                              icon: const Icon(
                                Icons.delete,
                                size: 25,
                              ));
                      }
                    ),
                  ],
                ),
                 Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Text('Color: ${widget.cartListItem.color??''}'),
                      const SizedBox(
                        width: 8,
                      ),
                      Text('Size: ${widget.cartListItem.size??''}'),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price: \$${widget.cartListItem.productListByRemark?.price ?? ''}',
                      style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                        Wrap(
                            children: [
                              Container(
                                  height: 30,
                                  width: 35,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 10),
                                  child: FloatingActionButton(
                                    backgroundColor: AppColors.primaryColor,
                                    onPressed: () {
                                     widget.cartListState.decrement(widget.index);
                                     },
                                    child: const Icon(Icons.remove),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: ValueListenableBuilder(
                                  valueListenable: widget.cartListState.counter[widget.index],
                                  builder: (BuildContext context, value, __) {
                                 return Text(
                                    '$value',
                                    style: const TextStyle(fontSize: 18),
                                  );
                                  }
                                ),
                              ),
                              Container(
                                  height: 30,
                                  width: 35,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 10),
                                  child: FloatingActionButton(
                                    backgroundColor: AppColors.primaryColor,
                                    onPressed: () {
                                      widget.cartListState.increment(widget.index);
                                    },
                                      child: const Icon(Icons.add),
                              )),
                        ],
                      )

                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
