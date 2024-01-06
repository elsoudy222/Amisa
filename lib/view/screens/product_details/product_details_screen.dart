import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/core/const/extensions.dart';
import 'package:amisa/view/screens/product_details/widgets/custom_collection_widget.dart';
import 'package:amisa/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'all_collections/all_collection_screen.dart';
import 'collection_details/collection_details_screen.dart';
import '../../../core/components/show_all_button/show_all_button.dart';
import 'photo_view/photo_view.dart';
import '../../screens_path.dart';
import '../home/widgets/custom_text_title/custom_title_text.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    String productTitle = homeCubit.productsDetailsModel!.product.productName;
    String productType = homeCubit.productsDetailsModel!.product.type;
    //String categoryTitle = homeCubit.brandModel!.category.categoryName;

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is SuccessGetCollectionDetailsStates) {
          context.push(const CollectionsDetailsScreen());
          debugPrint(
              "======================== SUCCESS ========================");
        }
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
                    // Carousel Slider :
                    SizedBox(
                      height: 290.h,
                      width: double.infinity,
                      child: PageView.builder(
                        controller: homeCubit.imageController,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return PhotoViewScreen(
                                    image: homeCubit.productsDetailsModel!
                                        .product.coverImages[index],
                                  );
                                },
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl:
                                "$baseImage${homeCubit.productsDetailsModel!.product.coverImages[index]}",
                            fit: BoxFit.fill,
                          ),
                        ),
                        itemCount: homeCubit
                            .productsDetailsModel!.product.coverImages.length,
                        allowImplicitScrolling: true,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SmoothPageIndicator(
                      controller: homeCubit.imageController,
                      count: homeCubit
                          .productsDetailsModel!.product.coverImages.length,
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
                  height: 10.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // // Screen Path :
                      // //  categoryTitle != "Kitchens"
                      // //      ? Text(
                      // //          "Home > $categoryTitle > $brandName > $productTitle ",
                      // //          style:  TextStyle(
                      // //              color: Colors.white, fontSize: 13.sp),
                      // //        )
                      // //      : Text(
                      // //          "Home > $categoryTitle > $brandName >  $productType > $productTitle ",
                      // //          style:  TextStyle(
                      // //              color: Colors.white, fontSize: 13.sp),
                      // //        ),
                      //  SizedBox(
                      //    height: 10.h,
                      //  ),
                      Text(
                        "$productTitle ",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),

                      homeCubit.productsDetailsModel!.product.description
                              .isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  "Description:",
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                // Text(
                                //   homeCubit.productsDetailsModel!.product.description,
                                //   style: TextStyle(
                                //     color: AppColors.white,
                                //     fontSize: 14.sp,
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // ),
                                ReadMoreText(
                                  homeCubit.productsDetailsModel!.product
                                      .description,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  trimLines: 6,
                                  colorClickableText: Colors.grey,

                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: 'Show more',
                                  trimExpandedText: 'Show less',
                                  moreStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          : Container(),
                      SizedBox(
                        height: 15.h,
                      ),
                      homeCubit.productsDetailsModel!.matrialinfo.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Characteristic:",
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Wrap(
                                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    spacing: 15.w,
                                    children: List.generate(
                                      homeCubit.productsDetailsModel!
                                          .matrialinfo.length,
                                      (index) => SizedBox(
                                          height: 60.h,
                                          width: 60.w,
                                          child: CachedNetworkImage(
                                              // color: Colors.white,
                                              imageUrl:
                                                  "$baseImage${homeCubit.productsDetailsModel!.matrialinfo[index].matrPhoto!}")),
                                    )),
                              ],
                            )
                          : Container(),

                      SizedBox(
                        height: 15.h,
                      ),
                      homeCubit.productsDetailsModel!.info.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sizes & Info:",
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Image(image: AssetImage(sizes)),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20.0.w),
                                      child: SizedBox(
                                        width: 300.w,
                                        child: Wrap(
                                          spacing: 15.w,
                                          children: List.generate(
                                            homeCubit.productsDetailsModel!.info
                                                .length,
                                            (index) => Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: 7.0.h),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    homeCubit
                                                        .productsDetailsModel!
                                                        .info[index]
                                                        .infoTitle,
                                                    style: TextStyle(
                                                      color: AppColors.white,
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Container(),

                      SizedBox(
                        height: 15.h,
                      ),
                      homeCubit.productsDetailsModel!.collections.isNotEmpty
                          ? CustomCollectionsWidget(
                              homeCubit: homeCubit,
                              length: homeCubit
                                  .productsDetailsModel!.collections.length,
                            )
                          : Container(),
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
