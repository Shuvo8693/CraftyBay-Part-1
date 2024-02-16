

import 'banner_item.dart';

class BannerList {
  String? msg;
  List<BannerItem>? bannerItemList;

  BannerList({this.msg, this.bannerItemList});

  BannerList.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      bannerItemList = <BannerItem>[];
      json['data'].forEach((v) {
        bannerItemList!.add(BannerItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (bannerItemList != null) {
      data['data'] = bannerItemList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


