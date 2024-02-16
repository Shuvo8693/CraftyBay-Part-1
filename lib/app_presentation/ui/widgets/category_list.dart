import 'package:ecommerce_project/app_presentation/data/model/all_category_list.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/bottom_nav_state.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/product_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/catagories.dart';
import '../utilities/app_colors.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key, required this.allCategoryListIndex,
  });

final AllCategoryList? allCategoryListIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: GestureDetector(
            onTap: (){
              Get.to(ProductCategoryScreen(
                categoryId: allCategoryListIndex!.id,
                categoryName: allCategoryListIndex!.categoryName,
              ));
            },
            // borderRadius: BorderRadius.circular(10),
            // splashColor: Colors.grey.shade200,
            // splashFactory: InkSparkle.splashFactory,
            child: Container(
                width: 70,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryColor.withOpacity(0.13),
                ),
                child:Image.network(allCategoryListIndex!.categoryImg.toString())),
          ),
        ),
        Expanded(
            flex: 1,
            child: Text(
              '${allCategoryListIndex?.categoryName}',
              style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500),
            ))
      ],
    );
  }
}