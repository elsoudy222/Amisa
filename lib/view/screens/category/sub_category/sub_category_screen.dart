import 'package:amisa/core/components/components.dart';
import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/view/screens/category/kitchens_type/kitchens_sub_category_type.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:amisa/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/custom_appbars/custom_sub_category_appbar.dart';
import '../../../../core/components/custom_sub_category_card/custom_sub_category_card.dart';

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
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var homeCubit = HomeCubit.get(context);
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
                              ),
                              backgroundImage: homeCubit
                                  .brandModel!.category.brands[i].brandCover,
                              description: '',
                              buttonText:
                                  'Show ${homeCubit.brandModel!.category.brands[i].brandName}',
                              onTap: () {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   // this will need to pass The name and ID for the company :
                                //   return KitchensSubCategoryType(
                                //     companyName: categoryCard[i]["name"],
                                //     companyLogo: categoryCard[i]["companyLogo"],
                                //   );
                                // }));
                              },
                            ),
                          );
                        },
                      )
                    : Center(
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
