import 'package:ecommerce_project/app_presentation/data/model/product_list_remark.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../stateHolder/bottom_nav_state.dart';
import '../../stateHolder/show_appbar_state.dart';
import '../widgets/product_card.dart';

class Wish extends StatefulWidget {
  const Wish({super.key, this.isSelected=false});

  final bool isSelected;

  @override
  State<Wish> createState() => _WishState();
}

class _WishState extends State<Wish>with TickerProviderStateMixin,AutomaticKeepAliveClientMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    Get.find<WishListState>().getWishList();
    animationController=AnimationController(vsync: this,duration: const Duration(seconds: 3))
      ..addListener(() {
        setState(() {});
      });
    animationController.repeat(reverse: true,max: 1);
    animationController.forward();
  }
  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PopScope(
      canPop: false,
      onPopInvoked: (_){
        Get.find<BottomNavState>().backHome();
      },
      child: Scaffold(
        appBar: widget.isSelected==true?Get.find<ShowAppBar>().appData(context): AppBar(
          leading: Builder(builder: (context){
            return  IconButton(onPressed: (){
              Get.find<BottomNavState>().backHome();
            }, icon: const Icon(Icons.arrow_back_ios),);
          }),
          title: const Text('Wish List'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: GetBuilder<WishListState>(
            builder: (wishListState) {
              if(wishListState.inProgress==true){
                return  Center(child: CircularProgressIndicator(value: animationController.value,semanticsLabel: 'Loading...',));
              }
              return GridView.builder(
                itemCount: wishListState.productWishListModel.wishListItem?.length??0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisExtent: 190,crossAxisSpacing: 1,mainAxisSpacing: 10),
                  itemBuilder: (context,index){
                 return Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 5),
                   child: ProductCard(
                       productListByRemark: (wishListState.productWishListModel.wishListItem?[index].productListByRemark??ProductListByRemark()),
                     productId: wishListState.productID,),
                 );
                  });
            }
          ),
        )
      ),
    );
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

