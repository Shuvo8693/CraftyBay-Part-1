import 'package:ecommerce_project/app_presentation/data/model/product_list_remark.dart';

class CartListModel {
  String? msg;
  List<CartListItem>? cartListItem;

  CartListModel({this.msg, this.cartListItem});

  CartListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      cartListItem = <CartListItem>[];
      json['data'].forEach((v) {
        cartListItem!.add(CartListItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (cartListItem != null) {
      data['data'] = cartListItem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartListItem {
  int? id;
  int? userId;
  int? productId;
  String? color;
  String? size;
  int qty=1;
  String? price;
  String? createdAt;
  String? updatedAt;
  ProductListByRemark? productListByRemark;

  CartListItem(
      {this.id,
        this.userId,
        this.productId,
        this.color,
        this.size,
        required this.qty,
        this.price,
        this.createdAt,
        this.updatedAt,
        this.productListByRemark});

  CartListItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    color = json['color'];
    size = json['size'];
    qty = int.tryParse(json['qty']??'')??0;
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productListByRemark =
    json['product'] != null ? ProductListByRemark.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['color'] = color;
    data['size'] = size;
    data['qty'] = qty;
    data['price'] = price;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (productListByRemark != null) {
      data['product'] = productListByRemark!.toJson();
    }
    return data;
  }
}

