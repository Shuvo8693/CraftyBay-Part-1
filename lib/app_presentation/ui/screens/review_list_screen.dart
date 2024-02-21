import 'package:ecommerce_project/app_presentation/stateHolder/product_by_remark_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/product_details_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/review_list_state.dart';
import 'package:ecommerce_project/app_presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'create_review_screen.dart';

class ReviewListScreen extends StatefulWidget {
  const ReviewListScreen({super.key, required this.productId});

 final int productId;
  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
   ProductDetailsState? productDetailState;

  @override
  void initState() {
    super.initState();
   productDetailState= Get.find<ProductDetailsState>();
    Get.find<ReviewListState>().getReviewList(widget.productId); //productDetailState?.getProductDetailsList?.productId??0
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews',style: TextStyle(fontSize: 19),),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: SizedBox(
              height: 600,
              child: GetBuilder<ReviewListState>(
                builder: (reviewListState) {
                  return ListView.builder(
                    itemCount: reviewListState.reviewListModel.reviewDataList?.length??0,
                      itemBuilder: (context,index){
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                                backgroundColor:
                                    AppColors.primaryColor.withOpacity(0.15),
                                child: const Icon(Icons.person)),
                            title:  Text(
                              '${reviewListState.reviewListModel.reviewDataList![index].profile?.cusName}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            subtitle:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 7,),
                                Text(
                                  '${reviewListState.reviewListModel.reviewDataList![index].description}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 15,),
                                Row(
                                  children: [
                                    reviewListState.reviewListModel.reviewDataList![index].rating=='1'
                                        ? const Icon(Icons.star,color: Colors.amber,)
                                        : reviewListState.reviewListModel.reviewDataList![index].rating=='2'
                                        ? const Row(children: [Icon(Icons.star,color: Colors.amber,),Icon(Icons.star,color: Colors.amber,)],)
                                        : reviewListState.reviewListModel.reviewDataList![index].rating=='3'
                                        ?const Row(children: [Icon(Icons.star,color: Colors.amber,),Icon(Icons.star,color: Colors.amber,),Icon(Icons.star,color: Colors.amber,)],)
                                        :reviewListState.reviewListModel.reviewDataList![index].rating=='4'
                                        ?const Row(children: [Icon(Icons.star,color: Colors.amber,),Icon(Icons.star,color: Colors.amber,),Icon(Icons.star,color: Colors.amber,),Icon(Icons.star,color: Colors.amber,),Icon(Icons.star_border_outlined)],)
                                        :reviewListState.reviewListModel.reviewDataList![index].rating=='5'
                                        ?const Row(children: [Icon(Icons.star,color: Colors.amber,),Icon(Icons.star,color: Colors.amber,),Icon(Icons.star,color: Colors.amber,),Icon(Icons.star,color: Colors.amber,),Icon(Icons.star,color: Colors.amber,),],)
                                        :const Icon(Icons.star_border_outlined),

                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GetBuilder<ReviewListState>(
                      builder: (reviewListState) {
                        return Text(
                          'Review (${reviewListState.reviewListModel.reviewDataList?.length??0})',
                          style:
                              const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                        );
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: FloatingActionButton(
                      backgroundColor: AppColors.primaryColor,
                      shape: const OvalBorder(eccentricity: 1),
                      tooltip: 'Give Review',
                      onPressed: () {
                        Get.to(() => CreateReviewScreen(productID: widget.productId,));
                      },
                      child: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
