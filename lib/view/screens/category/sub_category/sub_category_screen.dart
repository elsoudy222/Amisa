import 'package:amisa/core/components/components.dart';
import 'package:amisa/core/const/extensions.dart';
import 'package:amisa/view/screens/category/abode_brand_types/abode_brand_types.dart';
import 'package:amisa/view/screens/category/kitchens_type/kitchens_sub_category_type.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:amisa/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../core/components/custom_appbars/custom_sub_category_appbar.dart';
import '../../../../core/components/custom_sub_category_card/custom_sub_category_card.dart';
import '../../../../core/components/toast/toast.dart';
import '../../products/products_screen.dart';

// ignore: must_be_immutable
class SubCategoryScreen extends StatelessWidget {
  final String categoryTitle;
  final String categoryDes;
  final String categoryImage;
  Function()? onTap;



  SubCategoryScreen(
      {super.key,
      this.onTap,
      required this.categoryTitle,
      required this.categoryDes,
      required this.categoryImage});

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    var brandName = homeCubit.brandModel!.category.brands[homeCubit.brandCurrentIndex].brandName;
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is LoadingGetAllProductsStates && categoryTitle != "Kitchens" && brandName != "ABODE")
        {
          MyDialog.showLoadingDialog();
        }
        else if (state is SuccessGetAllProductsStates && categoryTitle != "Kitchens"&& brandName != "ABODE")
        {
          EasyLoading.dismiss();
          context.push(
            ProductsScreen(
              type: "",
              brandName: homeCubit.brandModel!.category.brands[homeCubit.brandCurrentIndex].brandName,
            ),
          );
        }
        else if (state is ErrorGetAllProductsStates && categoryTitle != "Kitchens" && brandName != "ABODE") {
          EasyLoading.dismiss();
          showErrorToast(
            context,
            msg: "There is No Products Yet!",
            time: 3,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomSubCategoryAppBar(
            title: categoryTitle,
            imageUrl: categoryImage,
            description: categoryDes,
          ),
          body: ConditionalBuilder(
            condition: state is! LoadingGetAllBrandsStates,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0.h),
                child: homeCubit.brandModel!.category.brands.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: homeCubit.brandModel!.category.brands.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: CustomSubCategoryCard(
                              badgeWidget: CachedNetworkImage(
                                imageUrl:
                                    "$baseImage${homeCubit.brandModel!.category.brands[i].brandPhoto}",
                                fit: BoxFit.cover,
                              ),
                              backgroundImage: homeCubit
                                  .brandModel!.category.brands[i].brandCover,
                              description: "",
                              buttonText:
                                  'Show ${homeCubit.brandModel!.category.brands[i].brandName}',
                              onTap: ()  {
                                debugPrint(categoryTitle);
                                if (categoryTitle == "Kitchens") {
                                  context.push(KitchensSubCategoryType(
                                      companyName: homeCubit.brandModel!
                                          .category.brands[i].brandName,
                                      brandId: homeCubit.brandModel!.category
                                          .brands[i].brandId,
                                      companyLogo: homeCubit.brandModel!
                                          .category.brands[i].brandPhoto,
                                      companyImage: homeCubit.brandModel!
                                          .category.brands[i].brandCover,
                                      categoryName: categoryTitle,
                                      brandDescription: homeCubit.brandModel!
                                          .category.brands[i].brandDescription,
                                    ),);
                                  homeCubit.changeBrandIndex(i);
                                  debugPrint("=================INDEX=====$i");
                                  debugPrint("==========  ${homeCubit.brandModel!.category.brands[i].brandName}");

                                }
                                else if (homeCubit.brandModel!.category.brands[i].brandName == "ABODE") {
                                  homeCubit.changeBrandIndex(i);
                                  debugPrint("=================Brand INDEX=====$i");
                                  debugPrint(
                                      "===ID =======  ${homeCubit.brandModel!.category.brands[i].brandId}");
                                  debugPrint(
                                      "===Brand Name =======  ${homeCubit.brandModel!.category.brands[i].brandName}");
                                  debugPrint(
                                      "===cat name =======  ${homeCubit.brandModel!.category.categoryName}");
                                  context.push(AbodeBrandTypes(
                                    companyName: homeCubit.brandModel!
                                        .category.brands[i].brandName,
                                    brandId: homeCubit.brandModel!.category
                                        .brands[i].brandId,
                                    companyLogo: homeCubit.brandModel!
                                        .category.brands[i].brandPhoto,
                                    companyImage: homeCubit.brandModel!
                                        .category.brands[i].brandCover,
                                    categoryName: categoryTitle,
                                    brandDescription: homeCubit.brandModel!
                                        .category.brands[i].brandDescription,
                                  ),);
                                }
                                else if (categoryTitle != "Kitchens") {
                                  homeCubit.getAllProducts(
                                    brandId:
                                        "${homeCubit.brandModel!.category.brands[i].brandId}",
                                  );
                                  homeCubit.changeBrandIndex(i);
                                  debugPrint("=================Brand INDEX=====$i");
                                  debugPrint(
                                      "===ID =======  ${homeCubit.brandModel!.category.brands[i].brandId}");
                                  debugPrint(
                                      "===Brand Name =======  ${homeCubit.brandModel!.category.brands[i].brandName}");
                                  debugPrint(
                                      "===cat name =======  ${homeCubit.brandModel!.category.categoryName}");
                                }
                              },
                            ),
                          );
                        },
                      )
                    :  Center(
                        child: Text(
                        "There are no brands in this category",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      )),
              );
            },
            fallback: (context) => customCircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
