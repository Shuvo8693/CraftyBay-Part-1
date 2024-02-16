import 'all_category_list.dart';

class AllCategorise {
  String? msg;
  List<AllCategoryList>? allCategoryList;

  AllCategorise({this.msg, this.allCategoryList});

  AllCategorise.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      allCategoryList = <AllCategoryList>[];
      json['data'].forEach((v) {
        allCategoryList!.add( AllCategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (allCategoryList != null) {
      data['data'] = allCategoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


