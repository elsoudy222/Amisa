import 'package:amisa/view/widgets/custom_news_card/custom_news_card.dart';
import 'package:amisa/view/widgets/custom_text_title/custom_title_text.dart';
import 'package:amisa/view_model/cubits/layout_cubit/layout_cubit.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/config_path.dart';
import '../../screens_path.dart';
import '../../widgets/custom_category_card/custom_category_card.dart';
import '../../widgets/show_all_button/show_all_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  final List<Map<String, dynamic>> categoryCard = [
    {
      'title': 'kitchens',
      'desc': "The Number One Italian Kitchen Company You Will Find Here.",
    },
    {
      'title': 'Ceramics',
      'desc': "The Number One Italian Kitchen Company You Will Find Here.",
    },
    {
      'title': 'Ceramics',
      'desc': "The Number One Italian Kitchen Company You Will Find Here.",
    },
  ];

  final List<String> newsDesc =[
    "The Number One Italian Kitchen Company You Will Find Here.",
    'We were pleased to welcome you in The Gulf Bride Show at The World Trade Center.Stay tuned for our upcoming events.',
    'We were pleased to welcome you in The Gulf Bride Show at The World Trade Center.Stay tuned for our upcoming events.',
    'We were pleased to welcome you in The Gulf Bride Show at The World Trade Center.Stay tuned for our upcoming events.',

  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // Section 1 : Image
                      Container(
                        height: 450.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.colorBurn),

                            /// This Image will be changes :--------------
                            image: const AssetImage(header1),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 30.w,
                              bottom: 55.h,
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 70.h,
                                    width: 215.w,
                                    child: const Text(
                                      "THE LUXURY\nDESTINATION",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 75.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      print(
                                          " **************** (Tapped) ****************");
                                    },
                                    child: Container(
                                      height: 50.h,
                                      width: 50.h,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white.withOpacity(.2)),
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.white,
                                        size: 25.sp,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              top: 55.h,
                              left: 160.w,
                              right: 160.w,
                              child: Image(
                                image: const AssetImage(appLogo),
                                height: 65.h,
                                width: 70.w,
                              ),
                            ),
                          ],
                        ),
                      ),
//-------------------------------------------------------------------------------------------

                      // Section 2 : New Arrivals .
                      Padding(
                        padding: EdgeInsets.only(top: 25.0.h, bottom: 10.h),
                        child: customTitleText(title: "new arrivals"),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                            scrollbarTheme: ScrollbarThemeData(
                          thumbColor: MaterialStateProperty.all(Colors.white),
                          trackBorderColor:
                              MaterialStateProperty.all(Colors.white),
                          trackColor: MaterialStateProperty.all(Colors.white),
                        )),
                        child: Scrollbar(
                          thumbVisibility: true,
                          trackVisibility: true,
                          scrollbarOrientation: ScrollbarOrientation.bottom,
                          thickness: 10,
                          radius: const Radius.circular(20),
                          interactive: true,
                          controller: scrollController,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: SizedBox(
                              height: 156.h,
                              child: ListView.builder(
                                  controller: scrollController,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  itemBuilder: (context, i) {
                                    return const CustomNewArrivalsCard();
                                  }),
                            ),
                          ),
                        ),
                      ),
                      //-------------------------------------------------------------------------------------------
                      // Section 3 : Categories .
                      Padding(
                        padding: EdgeInsets.only(top: 25.0.h, bottom: 10.h),
                        child: customTitleText(title: "Categories"),
                      ),
                      categoryCard.length > 2
                          ? Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 2,
                                  itemBuilder: (context, i) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 12.h),
                                      child: CustomCategoryCard(
                                        categoryTitle: categoryCard[i]["title"],
                                        description: categoryCard[i]["desc"],
                                        backgroundImage: ceramics,
                                        onTap: () {},
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                CustomShowAllButton(
                                  onTap: () {
                                    /* First: Change bottom nav bar index to (1)
                              that's CategoryScreen Index.
                              Second : Call changeBottomNavBar function .
                               */
                                    cubit.currentIndex = 1;
                                    cubit
                                        .changeBottomNavBar(cubit.currentIndex);
                                  },
                                ),
                              ],
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: categoryCard.length,
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 12.h),
                                  child: CustomCategoryCard(
                                    categoryTitle: categoryCard[i]["title"],
                                    description: categoryCard[i]["desc"],
                                    backgroundImage: ceramics,
                                    onTap: () {},
                                  ),
                                );
                              },
                            ),
                      SizedBox(
                        height: 15.h,
                      ),
//-------------------------------------------------------------------------------------------

                      // Section 3 : Latest News .
                      Padding(
                        padding: EdgeInsets.only(top: 25.0.h, bottom: 10.h),
                        child: customTitleText(title: "latest NEWS"),
                      ),
                      newsDesc.length > 2
                          ? Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:2,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 12.h),
                                child: CustomNewsCard(
                                  newsDesc: newsDesc[i],
                                  backgroundImage: news,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CustomShowAllButton(
                            onTap: () {
                              /* First: Change bottom nav bar index to (1)
                              that's CategoryScreen Index.
                              Second : Call changeBottomNavBar function .
                               */
                              // cubit.currentIndex = 1;
                              // cubit
                              //     .changeBottomNavBar(cubit.currentIndex);
                            },
                          ),
                        ],
                      )
                          : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: categoryCard.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: CustomNewsCard(
                              newsDesc: newsDesc[i],
                              backgroundImage: news,
                            ),
                          );
                        },
                      ),

                    ],
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
