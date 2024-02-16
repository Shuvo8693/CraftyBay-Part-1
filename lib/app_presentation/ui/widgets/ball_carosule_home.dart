import 'package:flutter/material.dart';

import '../../data/model/banner_item.dart';
import '../../data/model/banner_list.dart';
import '../utilities/app_colors.dart';

class BollCarousel extends StatefulWidget {

  const BollCarousel({super.key, required this.index, required this.bannerItemList, });

  final int index;
  final List<BannerItem> bannerItemList;

  @override
  State<BollCarousel> createState() => _BollCarouselState();
}

class _BollCarouselState extends State<BollCarousel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for(int i=0;i<widget.bannerItemList.length;i++)
          Container(
            width: 18,
            height: 18,
            margin:  const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: widget.index==i?AppColors.primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color:i==widget.index? Colors.transparent:Colors.grey)
            ),

          )
      ],
    );
  }
}
