import 'package:ecommerce_project/app_presentation/data/model/product_list_remark.dart';

class WishListItem {
  int? id;
  int? productId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  ProductListByRemark? productListByRemark;

  WishListItem(
      {this.id,
        this.productId,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.productListByRemark});

  WishListItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productListByRemark =
    json['product'] != null ?  ProductListByRemark.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (productListByRemark != null) {
      data['product'] = productListByRemark!.toJson();
    }
    return data;
  }
}