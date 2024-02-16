import 'package:ecommerce_project/app_presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../stateHolder/bottom_nav_state.dart';
import '../../stateHolder/show_appbar_state.dart';

class Wish extends StatelessWidget {
  const Wish({super.key, this.isSelected=false});

  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_){
        Get.find<BottomNavState>().backHome();
      },
      child: Scaffold(
        appBar: isSelected==true?Get.find<ShowAppBar>().appData(context): AppBar(
          leading: Builder(builder: (context){
            return  IconButton(onPressed: (){
              Get.find<BottomNavState>().backHome();
            }, icon: const Icon(Icons.arrow_back_ios),);
          }),
          title: Text('Wish List'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: GridView.builder(
            itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisExtent: 180,crossAxisSpacing: 2,mainAxisSpacing: 10),
              itemBuilder: (context,index){
             return Padding(
               padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 5),
              // child: ProductCard(),
             );
              }),
        )
      ),
    );
  }
}
