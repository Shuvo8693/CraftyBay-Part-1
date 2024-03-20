import 'package:ecommerce_project/app_presentation/data/model/wish_list_item.dart';

class ProductWishListModel {
  String? msg;
  List<WishListItem>? wishListItem;

  ProductWishListModel({this.msg, this.wishListItem});

  ProductWishListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      wishListItem = <WishListItem>[];
      json['data'].forEach((v) {
        wishListItem!.add(WishListItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (wishListItem != null) {
      data['data'] = wishListItem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



