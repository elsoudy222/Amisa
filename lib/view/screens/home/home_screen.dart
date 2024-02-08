import 'package:amisa/screens_path.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ///================================================================
    var layoutCubit = LayoutCubit.get(context);
    var homeCubit = HomeCubit.get(context);

    ///================================================================

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is LoadingGetProductDetailsStates) {
          MyDialog.showLoadingDialog();
        } else if (state is SuccessGetProductDetailsStates) {
          EasyLoading.dismiss();

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ProductDetailsScreen();
          }));
        } else if (state is ErrorGetProductDetailsStates) {
          EasyLoading.dismiss();
          debugPrint("============= Error get product details ===============");
        }

        if (state is SuccessGetAllBrandsStates) {
          EasyLoading.dismiss();
          context.push(
            SubCategoryScreen(
              categoryTitle: layoutCubit.homeModel!
                  .categories[homeCubit.categoryCurrentIndex].catName,
              categoryDes: layoutCubit.homeModel!
                  .categories[homeCubit.categoryCurrentIndex].description,
              categoryImage: layoutCubit
                  .homeModel!.categories[homeCubit.categoryCurrentIndex].image,
            ),
          );
        } else if (state is LoadingGetAllBrandsStates) {
          MyDialog.showLoadingDialog();
        } else if (state is ErrorGetAllBrandsStates) {
          EasyLoading.dismiss();
          showErrorToast(
            context,
            msg: "Check your internet connection!",
            time: 3,
          );
        }
      },
      builder: (context, state) {
        // if (state is LoadingHomeDataStates) {
        //   return customCircularProgressIndicator();
        // }
        // else if (state is ErrorHomeDataStates) {
        //   return Container(
        //     color: Colors.orange,
        //   );
        // }
        // else {}
        return ConditionalBuilder(
          condition: layoutCubit.homeModel != null,
          builder: (context) {
            return Scaffold(
              // appBar: CustomHeaderWidget(),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    /// Section 1 : Image
                    CustomHeaderWidget(),

                    ///------------------------------------------------------------------------------------------
                    layoutCubit.homeModel!.ads.isNotEmpty
                        ? const CustomDiscountWidget()
                        : Container(),

                    ///------------------------------------------------------------------------------------------,
                    /// Section 2 : (New Arrivals) .
                    layoutCubit.homeModel!.newArrival.isNotEmpty
                        ? Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 25.0.h, bottom: 10.h),
                          child: customTitleText(title: "new arrivals"),
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                              scrollbarTheme: ScrollbarThemeData(
                                thumbColor:
                                MaterialStateProperty.all(Colors.white),
                                trackBorderColor:
                                MaterialStateProperty.all(Colors.grey),
                              )),
                          child: Scrollbar(
                            thumbVisibility: true,
                            trackVisibility: true,
                            scrollbarOrientation:
                            ScrollbarOrientation.bottom,
                            thickness: 4.h,
                            radius: const Radius.circular(20),
                            interactive: true,
                            controller:
                            homeCubit.newArrivalsScrollController,
                            child: SizedBox(
                              height: 156.h,
                              child: Padding(
                                padding:
                                const EdgeInsets.only(bottom: 5.0),
                                child: ListView.builder(
                                    controller: homeCubit
                                        .newArrivalsScrollController,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: layoutCubit
                                        .homeModel!.newArrival.length,
                                    itemBuilder: (context, i) {
                                      return InkWell(
                                        onTap: () async {
                                          homeCubit.getProductDetails(
                                              layoutCubit.homeModel!
                                                  .newArrival[i].id);
                                        },
                                        child: CustomNewArrivalsCard(
                                          title: layoutCubit.homeModel!
                                              .newArrival[i].brandName,
                                          subtitle: layoutCubit
                                              .homeModel!
                                              .newArrival[i]
                                              .productName,
                                          image: layoutCubit.homeModel!
                                              .newArrival[i].photo,
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                        : Container(),

                    ///-------------------------------------------------------------------------------------------
                    /// Section 3 : (Categories) .
                    Padding(
                      padding: EdgeInsets.only(
                        top: 25.0.h,
                      ),
                      child: customTitleText(title: "Categories"),
                    ),
                    layoutCubit.homeModel!.categories.length > 2
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
                                  layoutCubit
                                      .homeModel!.categories[i].catName
                                      .toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                description: layoutCubit.homeModel!
                                    .categories[i].description,
                                backgroundImage: layoutCubit
                                    .homeModel!.categories[i].image,
                                onTap: () {
                                  homeCubit.changeIndex(i);
                                  homeCubit.getAllBrands(layoutCubit
                                      .homeModel!.categories[i].id);
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
                            /// First: Change bottom nav bar index to (1)
                            /// that's CategoryScreen Index.
                            /// Second : Call changeBottomNavBar function .

                            layoutCubit.currentIndex = 1;

                            layoutCubit.changeBottomNavBar(
                                layoutCubit.currentIndex);

                            homeCubit.categoryCurrentIndex = 0;
                            homeCubit.changeIndex(
                                homeCubit.categoryCurrentIndex);
                          },
                          title: 'show all',
                        ),
                      ],
                    )
                        : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                      layoutCubit.homeModel!.categories.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: CustomSubCategoryCard(
                            badgeBackgroundColor:
                            Colors.black.withOpacity(0.5),
                            badgeWidget: Text(
                              layoutCubit
                                  .homeModel!.categories[i].catName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            description: layoutCubit
                                .homeModel!.categories[i].description,
                            backgroundImage: layoutCubit
                                .homeModel!.categories[i].image,
                            onTap: () {
                              homeCubit.changeIndex(i);
                              homeCubit.getAllBrands(layoutCubit
                                  .homeModel!.categories[i].id);
                            },
                            buttonText: 'shop now',
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),

                    ///-------------------------------------------------------------------------------------------

                    /// Section 3 : (Latest News) .
                    ///
                    layoutCubit.homeModel!.news.isNotEmpty
                        ?Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 25.0.h,
                          ),
                          child: customTitleText(title: "latest NEWS"),
                        ),
                        layoutCubit.homeModel!.news.length > 2
                            ? Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 10.h),
                                  child: InkWell(
                                    onTap: () {
                                      context.push(NewsDetails(index: i));
                                    },
                                    child: CustomNewsCard(
                                      newsDesc: layoutCubit
                                          .homeModel!.news[i].title,
                                      backgroundImage: layoutCubit
                                          .homeModel!.news[i].image,
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CustomShowAllButton(
                              onTap: () {
                                context.push(const AllNewsScreen());
                              },
                              title: 'show all',
                            ),
                          ],
                        )
                            : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: layoutCubit.homeModel!.news.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: CustomNewsCard(
                                newsDesc: layoutCubit
                                    .homeModel!.news[i].description,
                                backgroundImage:
                                layoutCubit.homeModel!.news[i].image,
                              ),
                            );
                          },
                        ),
                      ],
                    )
                        :Container(),
                  ],
                ),
              ),
            );
          },
          fallback: (context) => Container(
            color: AppColors.scaffoldBackground,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: MyDialog.showLoadingDialog(),
            ),
          ),
          // fallback: (context) => customCircularProgressIndicator(),
        );
      },
    );
  }
}
