import 'package:ecommerce_project/app_presentation/stateHolder/all_category_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/banner_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/bottom_nav_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/cart_list_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/cart_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/create_cartlist_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/create_review_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/create_and_remove_wishlist_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/invoice_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/otp_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/product_by_remark_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/product_category_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/product_details_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/read_profiledata_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/regex_controller.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/review_list_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/send_email&otp_controller.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/show_appbar_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/signup_profile_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/wishlist_state.dart';
import 'package:get/get.dart';
import 'app_presentation/stateHolder/auth_controller.dart';
import 'app_presentation/stateHolder/delete_cartlist_state.dart';

class StateBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(BottomNavState());
    Get.put(ShowAppBar());
    Get.put(ProductDetailsState());
    Get.put(CartState());
    Get.put(CreateCartListState());
    Get.put(CartListState());
    Get.put(DeleteCartListState());
    Get.put(CreateAndRemoveWishListState());
    Get.put(WishListState());
    Get.put(RegexController());
    Get.put(InvoiceState());
    Get.put(CreateReviewState());
    Get.put(ReviewListState());
    Get.put(SendEmailAndOtpController());
    Get.put(OtpState());
    Get.put(ReadProfileState());
    Get.put(SignUpProfileState());
    Get.put(BannerState());
    Get.put(AllCategoryState());
    Get.put(ProductByRemarkState());
    Get.put(ProductCategoryState());
  }
}