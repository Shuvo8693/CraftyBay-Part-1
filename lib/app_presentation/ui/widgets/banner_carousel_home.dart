import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../data/model/banner_item.dart';
import '../utilities/app_colors.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({
    super.key, required this.height,
    required this.currentIndex,
    this.colors,
    this.borderRadius, this.imageWidth, required this.bannerItemList,
    });

  final double? height;
   final ValueNotifier<int> currentIndex;
   final Color? colors;
   final BorderRadius? borderRadius;
   final double? imageWidth;
  final List<BannerItem> bannerItemList;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}
class _BannerCarouselState extends State<BannerCarousel> {
  //int _currentIndex=0; we can use this index alternative of ValueNotifier


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: widget.height?? 180,
              viewportFraction: 1,
              onPageChanged: (index,reason){
                widget.currentIndex.value=index;
              },
            autoPlay: true
          ),
          items: widget.bannerItemList.map((bannerListValue) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: widget.borderRadius ?? BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      child: Image.network(
                        bannerListValue.image ?? 'No Image',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 180,left: 10,top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${bannerListValue.price}',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: bannerListValue.id == 1
                                    ? Colors.redAccent
                                    : bannerListValue.id == 3
                                        ? Colors.blueAccent
                                        : bannerListValue.id == 4
                                            ? Colors.green
                                            : Colors.blueAccent),
                          ),
                          const SizedBox(height: 15,),
                          Text('${bannerListValue.title}',style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                          const SizedBox(height: 15,),
                          Text('${bannerListValue.shortDes}',softWrap: true,maxLines: 4,style: const TextStyle(color: Colors.black45),),
                      ],),
                    )

                  ],
                );
              },
            );
          }).toList(),
        ),


      ],
    );
  }
}