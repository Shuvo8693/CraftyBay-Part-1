import 'package:ecommerce_project/app_presentation/stateHolder/all_category_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/banner_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/bottom_nav_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/cart_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/product_by_remark_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/product_category_state.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/cart.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/catagories.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/home.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/product_details_screen.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/wish.dart';
import 'package:ecommerce_project/app_presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key,});



  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}
class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  BottomNavState bottomNavState = Get.find<BottomNavState>();

  final List<Widget> _screens= const[
    // screen er index e serial ta maintain kore screen show hoy
    Home(isSelected: true),
    Categorise(),
    CartScreen(),
    Wish(),
  ];

 @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      Get.find<BannerState>().slider();
      Get.find<AllCategoryState>().getAllCategory();
      Get.find<ProductByRemarkState>().popularProduct();
      Get.find<ProductByRemarkState>().specialProduct();
      Get.find<ProductByRemarkState>().newProduct();
    });

  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavState>(
      builder: (controller) {
        return Scaffold(
          //appBar: appData,
          body: _screens[bottomNavState.stateIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primaryColor,
              currentIndex: bottomNavState.stateIndex , //tap number er selected color & other customization trigger korbe
              onTap:bottomNavState.onTapIndex,
              items:  const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: 'Categorise'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.wallet_giftcard_outlined),label: 'Wish'),
              ]) ,
        );
      }
    );
  }


}



