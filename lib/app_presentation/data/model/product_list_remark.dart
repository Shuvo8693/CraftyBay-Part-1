
import 'all_category_list.dart';

class ProductRemark {
  String? msg;
  List<ProductListByRemark>? productListByRemark;

  ProductRemark({this.msg, this.productListByRemark});

  ProductRemark.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productListByRemark = <ProductListByRemark>[];
      json['data'].forEach((v) {
        productListByRemark!.add(ProductListByRemark.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (productListByRemark != null) {
      data['data'] = productListByRemark!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductListByRemark {
  int? id;
  String? title;
  String? shortDes;
  String? price;
  int? unitPrice;
  int? discount;
  String? discountPrice;
  String? image;
  int? stock;
  int? star;
  String? remark;
  int? categoryId;
  int? brandId;
  String? createdAt;
  String? updatedAt;
  Brand? brand;
  AllCategoryList? allCategoryList;

  ProductListByRemark(
      {this.id,
        this.title,
        this.shortDes,
        this.price,
        this.unitPrice,
        this.discount,
        this.discountPrice,
        this.image,
        this.stock,
        this.star,
        this.remark,
        this.categoryId,
        this.brandId,
        this.createdAt,
        this.updatedAt,
        this.brand,
        this.allCategoryList});

  ProductListByRemark.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDes = json['short_des'];
    price = json['price'];
    unitPrice = int.tryParse(json['price']);
    discount = json['discount'];
    discountPrice = json['discount_price'];
    image = json['image'];
    stock = json['stock'];
    star = json['star'];
    remark = json['remark'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    allCategoryList = json['category'] != null
        ? AllCategoryList.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['short_des'] = shortDes;
    data['price'] = price;
    data['discount'] = discount;
    data['discount_price'] = discountPrice;
    data['image'] = image;
    data['stock'] = stock;
    data['star'] = star;
    data['remark'] = remark;
    data['category_id'] = categoryId;
    data['brand_id'] = brandId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    if (allCategoryList != null) {
      data['category'] = allCategoryList!.toJson();
    }
    return data;
  }
}

class Brand {
  int? id;
  String? brandName;
  String? brandImg;
  String? createdAt;
  String? updatedAt;

  Brand({this.id, this.brandName, this.brandImg, this.createdAt, this.updatedAt});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brandName'];
    brandImg = json['brandImg'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['brandName'] = brandName;
    data['brandImg'] = brandImg;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

