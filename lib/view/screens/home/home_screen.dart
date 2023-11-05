import 'package:amisa/view/screens/home/widgets/custom_header_widget/custom_header_widget.dart';
import 'package:amisa/view/screens/home/widgets/custom_new_arrivals/custom_new_arrivals_card.dart';
import 'package:amisa/view/screens/home/widgets/custom_news_card/custom_news_card.dart';
import 'package:amisa/view/widgets/custom_text_title/custom_title_text.dart';
import 'package:amisa/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:amisa/view_model/cubits/layout_cubit/layout_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var layoutCubit = LayoutCubit.get(context);
        var homeCubit = HomeCubit.get(context);
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
                    trackBorderColor: MaterialStateProperty.all(Colors.grey),
                  )),
                  child: Scrollbar(
                    thumbVisibility: true,
                    trackVisibility: true,
                    scrollbarOrientation: ScrollbarOrientation.bottom,
                    thickness: 4.h,
                    radius: const Radius.circular(20),
                    interactive: true,
                    controller: homeCubit.scrollController,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        height: 156.h,
                        child: ListView.builder(
                            controller: homeCubit.scrollController,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, i) {
                              return const CustomNewArrivalsCard(
                                title: 'lube',
                                subtitle: 'oltre',
                              );
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
                homeCubit.categoryCard.length > 2
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
                                    "${homeCubit.categoryCard[i]["title"]}"
                                        .toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  description: homeCubit.categoryCard[i]
                                      ["desc"],
                                  backgroundImage: ceramics,
                                  onTap: () {},
                                  buttonText: 'shop now',
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 15.h,),
                          CustomShowAllButton(
                            onTap: () {
                              /* First: Change bottom nav bar index to (1)
                                        that's CategoryScreen Index.
                                 Second : Call changeBottomNavBar function .
                              */
                              layoutCubit.currentIndex = 1;
                              layoutCubit.changeBottomNavBar(layoutCubit.currentIndex);
                            },
                          ),
                        ],
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: homeCubit.categoryCard.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: CustomSubCategoryCard(
                              // categoryTitle: categoryCard[i]["title"],
                              badgeWidget: Text(
                                homeCubit.categoryCard[i]["title"],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              description: homeCubit.categoryCard[i]["desc"],
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
                homeCubit.newsDesc.length > 2
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
                                  newsDesc: homeCubit.newsDesc[i],
                                  backgroundImage: news,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CustomShowAllButton(
                            onTap: () {},
                          ),
                        ],
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: homeCubit.categoryCard.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: CustomNewsCard(
                              newsDesc: homeCubit.newsDesc[i],
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
