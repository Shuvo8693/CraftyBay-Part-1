import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../stateHolder/product_category_state.dart';
import '../widgets/product_card.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({super.key, this.categoryId, this.categoryName});
  final int? categoryId;
  final String? categoryName;

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {

  @override
  void initState() {
    super.initState();
    if(widget.categoryId != null){
      Get.find<ProductCategoryState>().getProductCategory(categoryId: widget.categoryId??0 );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context){
          return IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back_ios),);
        }),
        title: Text(widget.categoryName??'Categorise'),
      ),
      body: GetBuilder<ProductCategoryState>(
          builder: (productCategoryState) {
            return GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                itemCount: productCategoryState.productRemark.productListByRemark?.length??0,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:  0.5,
                    mainAxisSpacing: MediaQuery.of(context).devicePixelRatio,
                    mainAxisExtent: 170,
                    crossAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ProductCard(productListByRemark: productCategoryState.productRemark.productListByRemark![index]),
                  );
                });
          }
      ),
    );;
  }
}
