import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/view/widgets/custom_category_card/custom_category_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatelessWidget {
  List<String> images = [
    header,
    header1,
    newArrivals,
    ceramics,
    news,
  ];
  List<String> category = [
    "Kitchens",
    "Ceramics",
    "Wardrobes",
    "ceramics",
    "news",
  ];

  List<Widget> generateImages() {
    return images
        .map(
          (e) => Container(
            width: 290.w,
            height: 430.h,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(25.w),
              image: DecorationImage(image: AssetImage(e), fit: BoxFit.cover),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                height: 70.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(25.w))),
                child: Center(
                  child: Text(
                    "Kitchens",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ]),
          ),
        )
        .toList();
  }

  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 30.h,),
          SizedBox(
            width: double.infinity,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(15.0.r),
                child: Text(
                  "Which category are \nyou looking for?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.sp, color: Colors.white),
                ),
              ),
            ),
          ),


          CarouselSlider(
            items: generateImages(),

            options: CarouselOptions(

              height: 430.h,
              enlargeCenterPage: true,
            ),
          ),
        ],
      ),
    );
  }
}


/// DEAD CODE :
// Container(
//   width: 290.w,
//   height: 430.h,
//   decoration: BoxDecoration(
//     color: Colors.orange,
//     borderRadius: BorderRadius.circular(25.w),
//     image: DecorationImage(
//         image: AssetImage(header1), fit: BoxFit.cover),
//   ),
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.end,
//     children: [
//       Container(
//         height: 70.h,
//         width: double.infinity,
//         decoration: BoxDecoration(
//             color: Colors.black.withOpacity(0.5),
//             borderRadius:
//                 BorderRadius.vertical(bottom: Radius.circular(25.w))),
//         child: Center(
//           child: Text(
//             "Kitchens",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20.sp,
//                 fontWeight: FontWeight.w500),
//           ),
//         ),
//       ),
//
//       // Padding(
//       //   padding: EdgeInsets.symmetric(vertical: 30.0.h),
//       //   child: InkWell(
//       //     onTap: (){},
//       //     child: Container(
//       //       height: 40.h,
//       //       width: 330.w,
//       //       decoration: BoxDecoration(
//       //           border: Border.all(color: Colors.white, width: .5)),
//       //       child: Row(
//       //         mainAxisAlignment: MainAxisAlignment.center,
//       //         children: [
//       //           Text(
//       //             "Shop Now".toUpperCase(),
//       //             style: TextStyle(
//       //                 color: Colors.white,
//       //                 fontWeight: FontWeight.w200,
//       //                 fontSize: 15.sp),
//       //           ),
//       //           SizedBox(
//       //             width: 10.w,
//       //           ),
//       //           const Image(image: AssetImage(arrow))
//       //         ],
//       //       ),
//       //     ),
//       //   ),
//       // ),
//     ],
//   ),
// ),