import 'package:ecommerce_project/app_presentation/data/model/product_detail_list.dart';

class ProductDetailsModel {
  String? msg;
  List<ProductDetailList>? productDetailList;

  ProductDetailsModel({this.msg, this.productDetailList});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productDetailList = <ProductDetailList>[];
      json['data'].forEach((v) {
        productDetailList!.add(ProductDetailList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (productDetailList != null) {
      data['data'] = productDetailList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}






