import 'package:ecommerce_project/app_presentation/stateHolder/all_category_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/banner_state.dart';
import 'package:ecommerce_project/app_presentation/stateHolder/product_by_remark_state.dart';
import 'package:ecommerce_project/app_presentation/ui/utilities/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../stateHolder/bottom_nav_state.dart';
import '../../stateHolder/show_appbar_state.dart';
import '../widgets/ball_carosule_home.dart';
import '../widgets/banner_carousel_home.dart';
import '../widgets/category_list.dart';
import '../widgets/product_card.dart';
import '../widgets/search_field_home.dart';
import '../widgets/section_home.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.isSelected});

  final bool isSelected;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BottomNavState bottomNavState = Get.find<BottomNavState>();
  final ValueNotifier<int> _currentIndex =
      ValueNotifier(0); // _currentIndex.value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isSelected == true
          ? Get.find<ShowAppBar>().appData(context)
          : AppBar(
              leading: Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    Get.find<BottomNavState>().backHome();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                );
              }),
              title: const Text('Cart'),
            ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SearchField(),
              const SizedBox(
                height: 13,
              ),
              GetBuilder<BannerState>(builder: (bannerState) {
                return Visibility(
                  visible: bannerState.inProgress == false,
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: BannerCarousel(
                    height: 180,
                    currentIndex: _currentIndex,
                    imageWidth: 210,
                    bannerItemList: bannerState.bannerList.bannerItemList ?? [],
                  ),
                );
              }),
              const SizedBox(
                height: 7,
              ),
              GetBuilder<BannerState>(builder: (bannerState) {
                return ValueListenableBuilder(
                  valueListenable: _currentIndex,
                  builder: (BuildContext context, index, Widget? child) {
                    return BollCarousel(
                      index: index,
                      bannerItemList:
                          bannerState.bannerList.bannerItemList ?? [],
                    );
                  },
                );
              }),
              const SizedBox(
                height: 6,
              ),
              Sections(
                title: 'All Categorise',
                onTapSeeAll: () {
                  bottomNavState.onTapIndex(1);
                },
              ),
              categoryProductList,
              const SizedBox(
                height: 5,
              ),
              Sections(
                title: 'Popular',
                onTapSeeAll: () {},
              ),
              popularProduct,
              const SizedBox(
                height: 5,
              ),
              Sections(
                title: 'Special',
                onTapSeeAll: () {},
              ),
              specialProduct,
              const SizedBox(
                height: 5,
              ),
              Sections(
                title: 'New',
                onTapSeeAll: () {},
              ),
              newProduct,
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get categoryProductList {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: GetBuilder<AllCategoryState>(builder: (allCategoryState) {
        return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoryList(
                allCategoryListIndex:
                    allCategoryState.allCategorise.allCategoryList![index],
              );
            },
            separatorBuilder: (_, __) => const SizedBox(
                  width: 10,
                ),
            itemCount:
                allCategoryState.allCategorise.allCategoryList?.length ?? 0);
      }),
    );
  }

  SizedBox get popularProduct {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: GetBuilder<ProductByRemarkState>(
          builder: (productByRemarkState) {
            if(productByRemarkState.popularProductRemark.productListByRemark == null ){
             return Center(child: Image.asset(AssetsPath.noImagePath,width: 100,));
        } else {
          return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                  child: SizedBox(
                    height: 120,
                    width: 140,
                    child: ProductCard(
                      productListByRemark: productByRemarkState
                          .popularProductRemark.productListByRemark![index],
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(
                    width: 10,
                  ),
              itemCount: productByRemarkState
                      .popularProductRemark.productListByRemark?.length ??
                  1);
        }
      }),
    );
  }

  SizedBox get specialProduct {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: GetBuilder<ProductByRemarkState>(builder: (productByRemarkState) {
        return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                child: SizedBox(
                  height: 120,
                  width: 140,
                  child: ProductCard(
                    productListByRemark: productByRemarkState
                        .specialProductRemark.productListByRemark![index],
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(
                  width: 10,
                ),
            itemCount: productByRemarkState
                    .specialProductRemark.productListByRemark?.length ??
                0);
      }),
    );
  }

  SizedBox get newProduct {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: GetBuilder<ProductByRemarkState>(builder: (productByRemarkState) {
        return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                child: SizedBox(
                  height: 120,
                  width: 140,
                  child: ProductCard(
                    productListByRemark: productByRemarkState
                        .newProductRemark.productListByRemark![index],
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(
                  width: 10,
                ),
            itemCount: productByRemarkState
                    .newProductRemark.productListByRemark?.length ?? 0);
      }),
    );
  }
}
