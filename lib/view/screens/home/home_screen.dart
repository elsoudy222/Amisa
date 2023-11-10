import 'package:amisa/core/const/extensions.dart';
import 'package:amisa/view/screens/home/widgets/custom_header_widget/custom_header_widget.dart';
import 'package:amisa/view/screens/home/widgets/custom_new_arrivals/custom_new_arrivals_card.dart';
import 'package:amisa/view/screens/home/widgets/custom_news_card/custom_news_card.dart';
import 'package:amisa/view/widgets/custom_text_title/custom_title_text.dart';
import 'package:amisa/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:amisa/view_model/cubits/layout_cubit/layout_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../core/components/components.dart';
import '../../../core/components/custom_sub_category_card/custom_sub_category_card.dart';
import '../../../core/components/show_all_button/show_all_button.dart';
import '../../../core/config/config_path.dart';
import '../../screens_path.dart';
import '../category/sub_category/sub_category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var layoutCubit = LayoutCubit.get(context);
    var homeCubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if(state is SuccessGetAllBrandsStates){
          EasyLoading.dismiss();
          context.push(SubCategoryScreen(
            categoryTitle: homeCubit.homeModel!.categories[homeCubit.currentIndex].catName,
            categoryDes: homeCubit.homeModel!.categories[homeCubit.currentIndex].description,
            categoryImage: homeCubit.homeModel!.categories[homeCubit.currentIndex].image,
          ),);
        }
        else if(state is LoadingGetAllBrandsStates){
          MyDialog.showLoadingDialog();
        }
      },
      builder: (context, state) {

        return ConditionalBuilder(
          condition: homeCubit.homeModel != null,
          builder: (context) {
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
                        controller: homeCubit.scrollController,
                        child: SizedBox(
                          height: 156.h,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ListView.builder(
                                controller: homeCubit.scrollController,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: homeCubit.homeModel!.newArrival.length,
                                itemBuilder: (context, i) {
                                  return CustomNewArrivalsCard(
                                    title: homeCubit.homeModel!.newArrival[i].brandName,
                                    subtitle: homeCubit.homeModel!.newArrival[i].productName,
                                    image: homeCubit.homeModel!.newArrival[i].photo,
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
                    homeCubit.homeModel!.categories.length > 2
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
                                        homeCubit
                                            .homeModel!.categories[i].catName
                                            .toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 19.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      description: homeCubit
                                          .homeModel!.categories[i].description,
                                      backgroundImage: homeCubit
                                          .homeModel!.categories[i].image,
                                      onTap: () {
                                        homeCubit.changeIndex(i);
                                        homeCubit.getAllBrands(homeCubit.homeModel!.categories[i].id);

                                      },
                                      buttonText: 'shop now',
                                      // model: homeCubit.homeModel!,
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
                                  layoutCubit.currentIndex = 1;
                                  layoutCubit.changeBottomNavBar(
                                      layoutCubit.currentIndex);
                                },
                              ),
                            ],
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: homeCubit.homeModel!.categories.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 12.h),
                                child: CustomSubCategoryCard(
                                 badgeBackgroundColor: Colors.black.withOpacity(0.5),
                                  badgeWidget: Text(
                                    homeCubit.homeModel!.categories[i].catName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  description: homeCubit
                                      .homeModel!.categories[i].description,
                                  backgroundImage:
                                      homeCubit.homeModel!.categories[i].image,
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
                    homeCubit.homeModel!.news.length > 2
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
                                      newsDesc: homeCubit.homeModel!.news[i].description,
                                      backgroundImage: homeCubit.homeModel!.news[i].image,
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
                            itemCount: homeCubit.homeModel!.news.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 12.h),
                                child: CustomNewsCard(
                                  newsDesc: homeCubit.homeModel!.news[i].description,
                                  backgroundImage: homeCubit.homeModel!.news[i].image,
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
            );
          },
          fallback: (context) => customCircularProgressIndicator(),
        );
      },
    );
  }


}
