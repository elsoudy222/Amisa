import 'package:amisa/core/components/components.dart';
import 'package:amisa/core/const/extensions.dart';
import 'package:amisa/view/screens/category/kitchens_type/kitchens_sub_category_type.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:amisa/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/components/custom_appbars/custom_sub_category_appbar.dart';
import '../../../../core/components/custom_sub_category_card/custom_sub_category_card.dart';
import '../../../../core/components/toast/toast.dart';
import '../../products/products_screen.dart';

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
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is LoadingGetAllProductsStates) {
          MyDialog.showLoadingDialog();
        } else if (categoryTitle != "Kitchens") {
          if (state is SuccessGetAllProductsStates) {
            EasyLoading.dismiss();
            context.push(
              ProductsScreen(
                type: homeCubit.productsModel!.products.type,
                brandName: homeCubit.productsModel!.products.brandName,
                categoryName: categoryTitle,
              ),
            );
          }
          else if (state is ErrorGetAllProductsStates) {
            EasyLoading.dismiss();
            showErrorToast(
              context,
              msg: "Sorry, There is no products yet",
              time: 3,
              gravity: ToastGravity.TOP
            );
            print("================================ ERROR =======================================");

          }
        }

        // if (state is LoadingGetBrandDetailsStates) {
        //   MyDialog.showLoadingDialog();
        // } else if (state is SuccessGetAllProductsStates) {
        //     EasyLoading.dismiss();
        //     context.push(
        //       ProductsScreen(
        //         type: homeCubit.productsModel!.products.type,
        //         brandName: homeCubit.productsModel!.products.brandName,
        //         categoryName: categoryTitle,
        //       ),
        //     );
        //   }
        //  else if (state is ErrorGetAllProductsStates) {
        //   EasyLoading.dismiss();
        // }

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
                              onTap: () {
                                print(categoryTitle);
                                if (categoryTitle == "Kitchens") {
                                  context.push(KitchensSubCategoryType(
                                      companyName: homeCubit.brandModel!
                                          .category.brands[i].brandName,
                                      brandId:
                                          "${homeCubit.brandModel!.category.brands[i].brandId}",
                                      companyLogo: homeCubit.brandModel!
                                          .category.brands[i].brandPhoto,
                                      companyImage: homeCubit.brandModel!
                                          .category.brands[i].brandCover,
                                      categoryName: categoryTitle,
                                    brandDescription: homeCubit.brandModel!.category.brands[i].brandDescription,
                                    ),);
                                  print(
                                      "==========  ${homeCubit.brandModel!.category.brands[i].brandName}");
                                } else if (categoryTitle != "Kitchens") {
                                  homeCubit.getAllProducts(brandId: "${homeCubit.brandModel!.category.brands[i].brandId}",);
                                  print("===ID =======  ${homeCubit.brandModel!.category.brands[i].brandId}");
                                  print("===cat name =======  ${homeCubit.brandModel!.category.categoryName}");
                                }

                              },
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Text(
                        "There are no brands in this category",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
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
