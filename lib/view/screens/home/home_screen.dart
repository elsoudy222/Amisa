import 'package:amisa/view/screens/category/sub_category/sub_category_screen.dart';
import 'package:amisa/view/screens/home/widgets/custom_header_widget/custom_header_widget.dart';
import 'package:amisa/view/screens/home/widgets/custom_new_arrivals/custom_new_arrivals_card.dart';
import 'package:amisa/view/screens/home/widgets/custom_news_card/custom_news_card.dart';
import 'package:amisa/view/widgets/custom_text_title/custom_title_text.dart';
import 'package:amisa/view_model/cubits/layout_cubit/layout_cubit.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/custom_sub_category_card/custom_sub_category_card.dart';
import '../../../core/components/show_all_button/show_all_button.dart';
import '../../../core/config/config_path.dart';
import '../../screens_path.dart';

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

  final List<String> newsDesc = [
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Section 1 : Image
                const CustomHeaderWidget(),
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
                        MaterialStateProperty.all(Colors.grey),
                  )),
                  child: Scrollbar(
                    thumbVisibility: true,
                    trackVisibility: true,
                    scrollbarOrientation: ScrollbarOrientation.bottom,
                    thickness: 4.h,
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
                  padding: EdgeInsets.only(
                    top: 25.0.h,
                  ),
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
                                child: CustomSubCategoryCard(
                                  badgeBackgroundColor:
                                      Colors.black.withOpacity(0.5),
                                  badgeWidget: Text(
                                    "${categoryCard[i]["title"]}"
                                        .toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  description: categoryCard[i]["desc"],
                                  backgroundImage: ceramics,
                                  onTap: () {},
                                  buttonText: 'shop now',
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
                              cubit.changeBottomNavBar(cubit.currentIndex);
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
                            child: CustomSubCategoryCard(
                              // categoryTitle: categoryCard[i]["title"],
                              badgeWidget: Text(
                                categoryCard[i]["title"],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              description: categoryCard[i]["desc"],
                              backgroundImage: ceramics,
                              onTap: () {
                                //TODO:
                              },
                              buttonText: 'shop now',
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
                  padding: EdgeInsets.only(
                    top: 25.0.h,
                  ),
                  child: customTitleText(title: "latest NEWS"),
                ),
                newsDesc.length > 2
                    ? Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
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
        );
      },
    );
  }
}
