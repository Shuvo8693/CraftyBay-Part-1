import 'package:ecommerce_project/app_presentation/stateHolder/all_category_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/bottom_nav_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/product_category_state.dart';
import 'package:ecommerce_project/app_presentation/ui/widgets/category_list.dart';
import 'package:ecommerce_project/app_presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../stateHolder/show_appbar_state.dart';

class Categorise extends StatefulWidget {
  const Categorise({super.key, this.isSelected=false, this.categorise});

   final String? categorise;
  final bool isSelected;


  @override
  State<Categorise> createState() => _CategoriseState();
}

class _CategoriseState extends State<Categorise> {
  String? categoryNames;

  @override
  Widget build(BuildContext context) {

    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Get.find<BottomNavState>().backHome();
      },
      child: Scaffold(
        appBar:widget.isSelected==true?Get.find<ShowAppBar>().appData(context): AppBar(
          leading: Builder(builder: (context){
            return IconButton(onPressed: (){
              Get.find<BottomNavState>().backHome();
            }, icon: const Icon(Icons.arrow_back_ios),);
          }),
          title: Text(categoryNames??'Categorise'),
        ),
        body: GetBuilder<AllCategoryState>(
          builder: (allCategoryState) {
            return GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                itemCount: allCategoryState.allCategorise.allCategoryList?.length??0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.5,
                    mainAxisSpacing: 0.5,
                    mainAxisExtent: 120,
                    crossAxisSpacing: 0),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  child: CategoryList(allCategoryListIndex: allCategoryState.allCategorise.allCategoryList![index]),
                );
                });
          }
        ),
      ),
    );
  }
}
