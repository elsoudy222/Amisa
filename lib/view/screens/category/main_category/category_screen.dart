import 'package:amisa/core/config/config_path.dart';
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
  List<String> categoryImage = [header, ceramics, header1, newArrivals, news];
  List<String> categoryTitle = [
    "header",
    "ceramics",
    "header1",
    "newArrivals",
    "news"
  ];
  List<Map<String, dynamic>> categoryModel = [
    {
      'title': 'kitchens',
      'image': header,
    },
    {
      'title': 'Ceramics',
      'image': ceramics,
    },
    {
      'title': 'Sanitary Ware',
      'image': newArrivals,
    },
    {
      'title': 'Wardrobes',
      'image': news,
    },
  ];
  CarouselController controller = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        //var cubit = LayoutCubit.get(context);
        return Scaffold(
          body: Column(
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
                  categoryModel.length,
                  (index) => carouselItemCard(
                    image: categoryModel[index]["image"],
                    title: categoryModel[index]["title"],
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
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
                        const Duration(milliseconds: 700),
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
                dotsCount: categoryModel.length,
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
        );
      },
    );
  }

  Widget carouselItemCard({
    required String image,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        //margin: EdgeInsets.all(20.r),
        width: 290.w,
        height: 430.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.w),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
            height: 66.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(25.w))),
            child: Center(
              child: Text(
                title.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
