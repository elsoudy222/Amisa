
import 'package:amisa/screens_path.dart';



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
    //var brandName = homeCubit.brandModel!.category.brands[homeCubit.brandCurrentIndex].brandName;
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is LoadingGetAllProductsStates && categoryTitle != "Kitchens"

        )
        {
          MyDialog.showLoadingDialog();
        }
        else if (state is SuccessGetAllProductsStates && categoryTitle != "Kitchens"

        )
        {
          EasyLoading.dismiss();
          context.push(
            ProductsScreen(
              type: "",
              brandName: homeCubit.brandModel!.category.brands[homeCubit.brandCurrentIndex].brandName,
            ),
          );
        }
        else if (state is ErrorGetAllProductsStates && categoryTitle != "Kitchens"

        ) {
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
                                  context.push(
                                    KitchensSubCategoryType(
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
                                  context.push(
                                      AbodeBrandTypes(
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
                                      ));
                                  debugPrint("=================Brand INDEX=====$i");
                                  debugPrint(
                                      "===ID =======  ${homeCubit.brandModel!.category.brands[i].brandId}");
                                  debugPrint(
                                      "===Brand Name =======  ${homeCubit.brandModel!.category.brands[i].brandName}");
                                  debugPrint(
                                      "===cat name =======  ${homeCubit.brandModel!.category.categoryName}");

                                }
                                else if (categoryTitle != "Kitchens" && homeCubit.brandModel!.category.brands[i].brandName != "ABODE") {
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
