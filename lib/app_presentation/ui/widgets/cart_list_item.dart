import 'package:ecommerce_project/app_presentation/stateHolder/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/app_colors.dart';
import '../utilities/assets_path.dart';

class CartListItem extends StatefulWidget {
  const CartListItem({
    super.key, required this.index,
  });

 final int index;

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.asset(
            AssetsPath.shoePath,
            width: 115,
            height: 100,
          ),
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
                    const SizedBox(
                      width: 205,
                      child: Text(
                        'Shoe name jkjhjkhjkhkjjhggjhgjh',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          size: 25,
                        )),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Text('Color: Red'),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Size: XL'),
                    ],
                  ),
                ),
                GetBuilder<CartState>(
                    builder: (cartState) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price: \$100',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 18,
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
                                elevation: cartState.counter[widget.index]==0? 0:null,
                                backgroundColor: cartState.counter[widget.index]==0? AppColors.primaryColor.withOpacity(0.5):AppColors.primaryColor,
                                onPressed: cartState.counter[widget.index]==0? null :() {
                                  cartState.decrementCount(widget.index);
                                },
                                child: const Icon(Icons.remove),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              '${cartState.counter[widget.index]}',
                              style: const TextStyle(fontSize: 18),
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
                                  cartState.incrementCount(widget.index);
                                },
                                child: const Icon(Icons.add),
                              )),
                        ],
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
