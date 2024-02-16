import 'package:ecommerce_project/app_presentation/data/model/product_list_remark.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/product_details_screen.dart';
import '../utilities/app_colors.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key, required this.productListByRemark,
  });

 final ProductListByRemark productListByRemark;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: (){
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

            Expanded(
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
                              child: const Icon(Icons.favorite_border_outlined,size: 18,color: Colors.white,)),
                          const SizedBox(width: 10,)
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