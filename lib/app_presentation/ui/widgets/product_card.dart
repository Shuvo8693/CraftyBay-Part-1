import 'package:ecommerce_project/app_presentation/data/model/product_list_remark.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/cart_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/create_wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../stateHolder/wishlist_state.dart';
import '../screens/product_details_screen.dart';
import '../utilities/app_colors.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key, required this.productListByRemark, this.productId,
  });

 final ProductListByRemark productListByRemark;
  final int? productId;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
 // int? iD;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: ()async{
       await Get.find<CartState>().getPrice();
        Get.offAll(()=> ProductDetailsScreen(productIdId: widget.productListByRemark.id??0,));
      },
      child: Card(
        color: Colors.transparent,
        surfaceTintColor: AppColors.primaryColor,
        elevation: 10,
        shadowColor: AppColors.primaryColor.withOpacity(0.1),
        margin: const EdgeInsets.symmetric(horizontal: 1),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            // ClipRRect(),
            Expanded(
                flex: 4, // we can use also ClipRRect for the picture
                child: Image.network(
                  widget.productListByRemark.image.toString() ?? '',
                  fit: BoxFit.cover,
                )),

            Flexible(
              flex: 2,
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    children: [
                       Text('${widget.productListByRemark.title}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text('\$${widget.productListByRemark.price}',style: const TextStyle(color:AppColors.primaryColor,fontWeight: FontWeight.bold)),
                           Wrap(
                            children: [
                              const Icon(Icons.star,size: 17,color: Colors.amber,),
                              Text('${widget.productListByRemark.star}'),
                            ],
                          ),
                          Card(
                              color: AppColors.primaryColor,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                  borderSide: BorderSide.none
                              ),
                              child: GetBuilder<CreateWishListState>(
                                builder: (createWishListState) {
                                  int id=widget.productListByRemark.id??0;
                                  return InkWell(
                                      onTap:widget.productId !=null?(){} :()async{
                                      bool result= await createWishListState.getToCreateWishList(id);
                                      if(result){
                                        Get.showSnackbar(const GetSnackBar(
                                          title: 'success',
                                          message: 'added to wishlist',
                                          isDismissible: true,
                                          duration: Duration(seconds: 2),
                                        ));
                                      }else{
                                        Get.showSnackbar(GetSnackBar(
                                          title: 'failed',
                                          message: createWishListState.errorMessage,
                                          isDismissible: true,
                                          duration: const Duration(seconds: 2),
                                        ));
                                      }
                                      },
                                      onLongPress: (){},
                                    child: widget.productId != null
                                        ? const Icon(
                                            Icons.delete_outline,
                                            size: 18,
                                            color: Colors.yellow,
                                          )
                                        : const Icon(
                                            Icons.favorite,
                                            size: 18,
                                            color: Colors.white70,
                                          ));
                              }
                              ) ),
                          const SizedBox(width: 2,)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}