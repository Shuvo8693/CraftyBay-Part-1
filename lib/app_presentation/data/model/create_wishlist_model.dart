
class CreateWishListItem {
  String? userId;
  String? productId;
  String? updatedAt;
  String? createdAt;
  int? id;

  CreateWishListItem(
      {this.userId, this.productId, this.updatedAt, this.createdAt, this.id});

  CreateWishListItem.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    productId = json['product_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
