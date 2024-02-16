import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../utilities/app_colors.dart';

class BannerCarouselProductDetails extends StatefulWidget {
  const BannerCarouselProductDetails({
    super.key, required this.height,
    required this.currentIndex,
    this.colors,
    this.borderRadius, this.imageWidth,  required this.urls,
    });

  final double? height;
   final ValueNotifier<int> currentIndex;
   final Color? colors;
   final BorderRadius? borderRadius;
   final double? imageWidth;
  final List<String> urls;

  @override
  State<BannerCarouselProductDetails> createState() => _BannerCarouselProductDetailsState();
}
class _BannerCarouselProductDetailsState extends State<BannerCarouselProductDetails> {
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
          items: widget.urls.map((url) {
            return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: widget.borderRadius ?? BorderRadius
                            .circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(url))),
                  );
                },
              );
          }).toList(),
        ),


      ],
    );
  }
}