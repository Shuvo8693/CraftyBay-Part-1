import 'package:ecommerce_project/app_presentation/stateHolder/create_review_state.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/bottom_nav_bar_screen.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/product_details_screen.dart';
import 'package:ecommerce_project/app_presentation/ui/screens/review_list_screen.dart';
import 'package:ecommerce_project/app_presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key, required this.productID});
final int productID;
  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {

  final TextEditingController _ratingTEC=TextEditingController();
  final TextEditingController _writeReviewTEC=TextEditingController();
  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Review'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40,),
                TextFormField(
                  controller: _ratingTEC,
                  maxLines: 1,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      hintText: 'Rating'
                  ),
                  validator: (String? value){
                    if(value!.isEmpty==true){
                      return'Enter your rating';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _writeReviewTEC,
                  maxLines: 8,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      hintText: 'Write Review '
                  ),
                  validator: (String? value){
                    if(value!.isEmpty==true){
                      return'Write Your Opinion';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30,),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<CreateReviewState>(
                    builder: (createReviewState) {
                      if(createReviewState.inProgress==true){
                       return const Center(child: CircularProgressIndicator(),);
                      }
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor),
                          onPressed: ()async{
                          if(_formKey.currentState!.validate()){
                           final result= await createReviewState.postCreateReview(
                              description: _writeReviewTEC.text.trim(),
                              productId: widget.productID,
                              rating: _ratingTEC.text.trim(),
                            );
                           if(result){
                             Get.showSnackbar(
                                 const GetSnackBar(
                                   title: 'Success',
                                   message: 'Review Done',
                                   isDismissible: true,
                                   duration: Duration(seconds: 2),
                                 ));
                            Get.off(()=>BottomNavBarScreen());
                           }else{
                             Get.showSnackbar(
                                 GetSnackBar(
                                   title: 'Failed',
                                   message: createReviewState.errorMessage,
                                   isDismissible: true,
                                   duration: const Duration(seconds: 2),
                                 ));
                           }
                          }else{
                            Get.showSnackbar(
                                const GetSnackBar(
                                  title: 'Failed',
                                  message: 'Review Not Completed',
                                  isDismissible: true,
                                  duration: Duration(seconds: 2),
                                ));
                          }
                          }, child: const Text('Submit',
                        style: TextStyle(fontSize: 16),));
                    }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _ratingTEC.dispose();
    _writeReviewTEC.dispose();
  }
}
