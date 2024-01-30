import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/core/const/extensions.dart';
import 'package:amisa/view/screens/layout/layout_screen.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../model/onboarding_model.dart';
import '../../../view_model/database/local/cache_helper.dart';

var boardController = PageController();

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  List<BoardingModel> boarding = [
    BoardingModel(
      image: kitchen,
      title: 'Kitchens',
      body: 'The Number One Of Italian Kitchens Company You Will Find Here',
    ),
    BoardingModel(
      image: ceramics,
      title: 'Ceramics',
      body:
          'Discover The Best Ceramics Creations, Unparalleled in Elegance and Quality',
    ),
    BoardingModel(
        image: wardrobes,
        title: 'Wardrobes',
        body: 'Italian Luxury Wardrobes Meet All Clients Needs'),
    BoardingModel(
        image: sanitary,
        title: 'Sanitary Ware',
        body: 'Body Screen 3'),
  ];

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        context.pushReplacement(const LayoutScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              // width: 75.w,
              //
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(25.r),
              //   color: Colors.white,
              //
              // ),
              child: TextButton(
                child: const Text(
                  'SKIP',
                  style: TextStyle(
                    color: Colors.white,
                  //  color: AppColors.scaffoldBackground,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  submit();
                },
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: boardController,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildOnBoarding(boarding[index]),
                    itemCount: boarding.length,
                    onPageChanged: (int index) {
                      if (index == boarding.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                      } else {
                        isLast = false;
                      }
                    },
                  ),
                ),
                Row(
                  children: [
                    SmoothPageIndicator(
                      controller: boardController,
                      count: boarding.length,
                      effect: const ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          activeDotColor: AppColors.white,
                          dotHeight: 10,
                          dotWidth: 10,
                          spacing: 5,
                          expansionFactor: 4),
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      backgroundColor: AppColors.white,
                      onPressed: () {
                        if (isLast) {
                          setState(() {
                            submit();
                          });
                        } else {
                          boardController.nextPage(
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      },
                      child: const Icon(Icons.arrow_forward_ios),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Widget buildOnBoarding(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 380.h,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                  image: AssetImage(model.image), fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            model.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.sp,
                color: AppColors.white),
          ),
          Text(
            model.body,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: AppColors.white.withOpacity(.7)),
          ),
        ],
      );
}
