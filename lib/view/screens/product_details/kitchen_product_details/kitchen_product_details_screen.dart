import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/view/screens/home/widgets/custom_new_arrivals/custom_new_arrivals_card.dart';
import 'package:amisa/view/widgets/custom_text_title/custom_title_text.dart';
import 'package:amisa/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../collection_screen.dart';
import '../../../screens_path.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String brandName;
  ProductDetailsScreen({super.key, required this.brandName});

  final PageController imageController = PageController();

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    String productTitle = homeCubit.productsDetailsModel!.product.productName;
    String productType = homeCubit.productsDetailsModel!.product.type;
    String categoryTitle = homeCubit.brandModel!.category.categoryName;

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if(state is SuccessGetCollectionDetailsStates){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const CollectionsScreen();
              },
            ),
          );
        }
        print("======================== SUCCESS ========================");
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: customTitleText(
                title: productTitle,
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 290.h,
                      width: double.infinity,
                      child: PageView.builder(
                        controller: imageController,
                        itemBuilder: (context, index) => CachedNetworkImage(
                          imageUrl: "$baseImage${homeCubit.productsDetailsModel!.product.coverImages[index]}",
                          fit:  BoxFit.fill,
                        ),
                        itemCount: homeCubit.productsDetailsModel!.product.coverImages.length,
                        allowImplicitScrolling: true,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SmoothPageIndicator(
                      controller: imageController,
                      count: homeCubit.productsDetailsModel!.product.coverImages.length,
                      effect: const WormEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Colors.white,
                        dotWidth: 25,
                        dotHeight: 4,
                        spacing: 3,
                        type: WormType.thin,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.all(20.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Screen Path :
                      categoryTitle != "Kitchens"
                          ? Text(
                        "Home > $categoryTitle > $brandName > $productTitle ",
                        style: const TextStyle(color: Colors.white,fontSize: 12),
                      )
                          :Text(
                        "Home > $categoryTitle > $brandName >  $productType > $productTitle ",
                        style: const TextStyle(color: Colors.white,fontSize: 12),
                      ) ,
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "$productTitle .",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),

                      Text(
                        "Description :\n${homeCubit.productsDetailsModel!.product.description}",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(
                        height: 15.h,
                      ),
                      homeCubit.productsDetailsModel!.info.isNotEmpty
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "More Information:",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Image(image: AssetImage(sizes)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                                child: SizedBox(
                                  width: 320.w,
                                  // margin: EdgeInsets.only(left: 10.w),
                                  //color: Colors.orange,
                                  child: Wrap(
                                    spacing: 8.w,
                                    children: List.generate(
                                        homeCubit.productsDetailsModel!.info.length,
                                            (index) => Padding(
                                              padding:  EdgeInsets.only(bottom: 7.0.h),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text(
                                                    homeCubit.productsDetailsModel!.info[index].infoTitle,
                                                    style: TextStyle(
                                                      color: AppColors.white,
                                                      fontSize: 15.sp,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Text(
                                                    "${homeCubit.productsDetailsModel!.info[index].infoValue}",
                                                    style: TextStyle(
                                                      color: AppColors.white,
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                      : Container(),


                      homeCubit.productsDetailsModel!.matrialinfo.isNotEmpty
                          ? Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              homeCubit.productsDetailsModel!.matrialinfo.length
                            , (index) =>  Container(
                              height: 60.h,
                                width: 60.w,
                                child: CachedNetworkImage(imageUrl: "$baseImage${homeCubit.productsDetailsModel!.matrialinfo[index].matrPhoto!}")),)


                          )
                      : Container(),

                      SizedBox(
                        height: 15.h,
                      ),
                      customTitleText(title: "DESIGN COLLECTIONS"),
                      SizedBox(
                        height: 15.h,
                      ),
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: homeCubit.productsDetailsModel!.collections.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                homeCubit.getCollectionDetails(homeCubit.productsDetailsModel!.collections[index].collectionsId);
                                print(homeCubit.productsDetailsModel!.collections[index].collectionsId.toString());

                              },
                              child: CustomNewArrivalsCard(
                                title: homeCubit.productsDetailsModel!.collections[index].collectionName,
                                subtitle: "",
                                image: homeCubit.productsDetailsModel!.collections[index].collectionphoto,
                                fit: BoxFit.fill,
                              ));
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
