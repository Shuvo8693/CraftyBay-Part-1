import 'package:ecommerce_project/app_presentation/stateHolder/cart_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/product_details_state.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/bottom_nav_bar_screen.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/review_list_screen.dart';
import 'package:ecommerce_project/app_presentation/ui/utilities/assets_path.dart';
import 'package:ecommerce_project/app_presentation/ui/widgets/cart_checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/app_colors.dart';
import '../widgets/banner_carousel_product_details.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productIdId});

  final int? productIdId;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}
class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  final ValueNotifier<int> _currentIndex = ValueNotifier(0); // _currentIndex.value
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      Get.find<CartState>().getPrice();
      color1 = Get
          .find<ProductDetailsState>()
          .getProductDetailsList
          ?.color
          ?.split(',')
          .map((e) => e)
          .last ?? '';
      size1 = Get
          .find<ProductDetailsState>()
          .getProductDetailsList
          ?.size
          ?.split(',')
          .map((e) => e)
          .first ?? '';
      Get.find<ProductDetailsState>().getProductDetails(
          productID: widget.productIdId ?? 0);
      Get.find<CartState>().update();
      Get.find<CartState>().init(index);
      initializePrice();

    });

  }
  Future<void> initializePrice()async{
    return await Get.find<CartState>().init(index);
  }

  int get index => 0;
  List<String> urls1 = [];
  String? size1;
  String? color1;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value){
        Get.offAll(BottomNavBarScreen());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product Details',style: TextStyle(fontWeight: FontWeight.w500),),
        ),
        body: GetBuilder<ProductDetailsState>(
            init: ProductDetailsState(),
            builder: (productDetailsState) {
              urls1 = productDetailsState.isData == true ? [] :
              [
                productDetailsState.getProductDetailsList?.img1 ?? '',
                productDetailsState.getProductDetailsList?.img2 ?? '',
                productDetailsState.getProductDetailsList?.img3 ?? '',
                productDetailsState.getProductDetailsList?.img4 ?? '',
              ];
              return Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Visibility(
                      visible: productDetailsState.inProgress == false,
                      replacement: const Center(
                        child: CircularProgressIndicator(),),
                      child: Stack(
                        children: urls1.isEmpty ? [
                          Image.asset(AssetsPath.noImagePath)
                        ] : [
                          BannerCarouselProductDetails(
                            height: 250,
                            currentIndex: _currentIndex,
                            colors: Colors.redAccent,
                            borderRadius: BorderRadius.zero,
                            imageWidth: 300,
                            urls: urls1,
                          ),
                          Positioned(
                              bottom: 13,
                              right: 5,
                              left: 5,
                              child: bollCarousel(urls1)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 260,
                                  height: 50,
                                  child: urls1.isEmpty ? Text(
                                    'Product Will Available Soon', maxLines: 2,
                                    softWrap: true,
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontWeight: FontWeight.w500),)
                                      : Text(
                                    productDetailsState.getProductDetailsList
                                        ?.productListByRemark?.title ??
                                        'Not Available', maxLines: 2,
                                    softWrap: true,
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontWeight: FontWeight.w500),),
                                ),
                                GetBuilder<CartState>(
                                  init: CartState(),
                                    builder: (cartState) {
                                      return productItemCount(cartState);
                                    },
                                )
                              ],
                            ),
                            ratingAndReviews(productDetailsState),
                            const SizedBox(height: 10,),
                            const Text('Colors', style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 10,),
                            colorSelection(productDetailsState),
                            const SizedBox(height: 10,),
                            const Text('Sizes', style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500)),
                            const SizedBox(height: 10,),
                            sizeSelection(productDetailsState),
                            const SizedBox(height: 14,),
                            Text('Description', style: Theme
                                .of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.black54,
                                fontWeight: FontWeight.w500),),
                            const SizedBox(height: 10,),
                             Text(
                             '${productDetailsState.getProductDetailsList?.des}',
                              style: const TextStyle(color: Colors.grey),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: CartCheckout(
                      textEB: 'AddToCart',
                      color1: color1,
                      size1: size1,
                      index: index,
                    ),

                  ),
                ],
              );
            }
        ),
      ),
    );
  }

  Row sizeSelection(ProductDetailsState productDetailsState) {
    return productDetailsState.isData == true ? const Row() : Row(
      children: productDetailsState.getProductDetailsList?.size?.split(',')
          .map((e) =>
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
                color: size1 == e
                    ? AppColors.primaryColor
                    : Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: size1 == e
                    ? null
                    : Border.all(color: Colors.black54)),
            child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  size1 = e;
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    e,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                )),
          ))
          .toList() ?? [],
    );
  }

  Row colorSelection(ProductDetailsState productDetailsState) {
    return productDetailsState.isData == true ? const Row() : Row(
      children: productDetailsState.getProductDetailsList?.color?.split(',')
          .map((e) =>
          Container(
            height: 30,
            width: 30,
            margin: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                color1 = e;
                setState(() {});
              },
              borderRadius: BorderRadius.circular(8),
              child: CircleAvatar(
                backgroundColor: e == 'Red'
                    ? Colors.red
                    : e == 'Green'
                    ? Colors.green
                    : e == 'White'
                    ? Colors.blueAccent
                    : Colors.black,
                child: color1 == e
                    ? const Icon(
                  Icons.done,
                  color: Colors.white,
                )
                    : null,
              ),
            ),
          ))
          .toList() ?? [],
    );
  }

  Row ratingAndReviews(ProductDetailsState productDetailsState) {
    return Row(
      children: [
        Wrap(
          children: [
            const Icon(
              Icons.star,
              size: 23,
              color: Colors.amber,
            ),
            Text(
              '${productDetailsState.getProductDetailsList?.productListByRemark
                  ?.star ?? 0.0}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: (){
            Get.to(ReviewListScreen(productId: widget.productIdId??0,));
          },
          child: const Text('Reviews',
              style: TextStyle(
                  color: AppColors.primaryColor, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(
          width: 10,
        ),
        Card(
            color: AppColors.primaryColor,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide.none),
            child: const Icon(
              Icons.favorite_border_outlined,
              size: 18,
              color: Colors.white,
            )),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Wrap productItemCount(CartState cartState) {
    return Wrap(
      children: [
        SizedBox(
            height: 30,
            width: 30,
            child: FloatingActionButton(
                heroTag: UniqueKey(),
                elevation: cartState.counter[index] == 0 ? 0 : 5,
                backgroundColor: cartState.counter[index] == 0
                    ? AppColors.primaryColor.withOpacity(0.5)
                    : AppColors.primaryColor,
                onPressed: () {
                  cartState.decrementCount(index);
                },
                child: const Icon(Icons.remove))),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 3, bottom: 10),
          child: Text(
            '${cartState.counter[index]}',
            textAlign: TextAlign.end,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
            height: 30,
            width: 30,
            child: FloatingActionButton(
                heroTag: UniqueKey(),
                backgroundColor: cartState.counter[index] > 5
                    ? AppColors.primaryColor.withOpacity(0.5)
                    : AppColors.primaryColor,
                onPressed: cartState.counter[index] > 5
                    ? () {}
                    : () {
                  cartState.incrementCount(index);
                },
                child: const Icon(Icons.add))),
      ],
    );
  }

  ValueListenableBuilder<int> bollCarousel(List urlA) {
    return ValueListenableBuilder(
      valueListenable: _currentIndex,
      builder: (BuildContext context, index, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(int i = 0; i < urlA.length; i++)
              Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: i == index ? AppColors.primaryColor : Colors
                        .transparent,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: i == index ? Colors.transparent : Colors.white)
                ),

              )
          ],
        );
      },
    );
  }

}

