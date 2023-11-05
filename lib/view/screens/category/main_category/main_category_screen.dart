import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/model/main_category_model.dart';
import 'package:amisa/view/screens/category/main_category/widgets/carousel_item_card.dart';
import 'package:amisa/view_model/cubits/layout_cubit/layout_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../sub_category/sub_category_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  List<MainCategoryModel> mainCategoryModel = [
    MainCategoryModel(categoryImage: header, categoryTitle: "Kitchens"),
    MainCategoryModel(categoryImage: ceramics, categoryTitle: "Ceramics"),
    MainCategoryModel(categoryImage: newArrivals, categoryTitle: "Sanitary Ware"),
    MainCategoryModel(categoryImage: news, categoryTitle: "Wardrobes"),
  ];
  // List<Map<String, dynamic>> categoryModel = [
  //   {
  //     'title': 'kitchens',
  //     'image': header,
  //   },
  //   {
  //     'title': 'Ceramics',
  //     'image': ceramics,
  //   },
  //   {
  //     'title': 'Sanitary Ware',
  //     'image': newArrivals,
  //   },
  //   {
  //     'title': 'Wardrobes',
  //     'image': news,
  //   },
  // ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

        return Scaffold(
          body: Padding(
            padding:  EdgeInsets.only(top: 20.0.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 45.0.w),
                      child: Text(
                        "Which category are \nyou looking for?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat-Black",
                        ),
                      ),
                    ),
                  ),
                ),
                CarouselSlider(
                  items: List.generate(
                    mainCategoryModel.length,
                    (index) => carouselItemCard(
                      image: mainCategoryModel[index].categoryImage,
                      title:  mainCategoryModel[index].categoryTitle,
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context){
                          return SubCategoryScreen(
                            onTap: () {
                              // TODO: Sub Category OnTap :
                            },
                          );
                        }));
                      },
                    ),
                  ),
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      height: 430.h,
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      }),
                ),
                SizedBox(
                  height: 25.h,
                ),
                DotsIndicator(
                  dotsCount: mainCategoryModel.length,
                  position: currentIndex,
                  decorator: DotsDecorator(
                    color: Colors.grey,
                    activeSize: Size(35.0.w, 6.0.h),
                    activeColor: Colors.white,
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


}
