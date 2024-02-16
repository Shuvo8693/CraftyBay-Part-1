import 'package:ecommerce_project/app_presentation/data/model/product_list_remark.dart';

class ProductDetailList {
  int? id;
  String? img1;
  String? img2;
  String? img3;
  String? img4;
  String? des;
  String? color;
  String? size;
  int? productId;
  String? createdAt;
  String? updatedAt;
  ProductListByRemark? productListByRemark;

  ProductDetailList(
      {this.id,
        this.img1,
        this.img2,
        this.img3,
        this.img4,
        this.des,
        this.color,
        this.size,
        this.productId,
        this.createdAt,
        this.updatedAt,
        this.productListByRemark});

  ProductDetailList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img1 = json['img1'];
    img2 = json['img2'];
    img3 = json['img3'];
    img4 = json['img4'];
    des = json['des'];
    color = json['color'];
    size = json['size'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productListByRemark =
    json['product'] != null ? ProductListByRemark.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['img1'] = img1;
    data['img2'] = img2;
    data['img3'] = img3;
    data['img4'] = img4;
    data['des'] = des;
    data['color'] = color;
    data['size'] = size;
    data['product_id'] = productId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (productListByRemark != null) {
      data['product'] = productListByRemark!.toJson();
    }
    return data;
  }
}