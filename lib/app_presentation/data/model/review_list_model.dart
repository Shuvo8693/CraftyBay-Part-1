import 'package:ecommerce_project/app_presentation/data/model/review_data_list.dart';

class ReviewListModel {
  String? msg;
  List<ReviewDataList>? reviewDataList;

  ReviewListModel({this.msg, this.reviewDataList});

  ReviewListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      reviewDataList = <ReviewDataList>[];
      json['data'].forEach((v) {
        reviewDataList!.add(ReviewDataList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (reviewDataList != null) {
      data['data'] = reviewDataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



