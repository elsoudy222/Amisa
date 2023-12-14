// import 'package:amisa/core/components/custom_appbars/custom_products-appbar.dart';
// import 'package:amisa/core/components/custom_sub_category_card/custom_sub_category_card.dart';
// import 'package:amisa/core/const/extensions.dart';
// import 'package:amisa/view/screens_path.dart';
// import 'package:amisa/view_model/cubits/home_cubit/home_cubit.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
//
// import '../../../core/components/components.dart';
// import '../category/sub_category/sub_category_screen.dart';
// import '../product_details/product_details_screen.dart';
//
// class ProductsScreen extends StatelessWidget {
//   final String type;
//   final String brandName;
//   final String categoryName;
//
//   const ProductsScreen({
//     super.key,
//     required this.type,
//     required this.brandName,
//     this.categoryName = "",
//   });
//
//   @override
//   Widget build(context) {
//     var homeCubit = HomeCubit.get(context);
//     return BlocConsumer<HomeCubit, HomeStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return Scaffold(
//             appBar: CustomProductAppbar(
//               title: "$brandName ${type == "type" ? "" : type}".toUpperCase(),
//               onTap: () {
//                 Navigator.pushReplacement(context,
//                     MaterialPageRoute(builder: (context) {
//                   return SubCategoryScreen(
//                     categoryTitle: homeCubit.homeModel!
//                         .categories[homeCubit.categoryCurrentIndex].catName,
//                     categoryDes: homeCubit.homeModel!
//                         .categories[homeCubit.categoryCurrentIndex].description,
//                     categoryImage: homeCubit.homeModel!
//                         .categories[homeCubit.categoryCurrentIndex].image,
//                   );
//                 }));
//               },
//             ),
//             body: Padding(
//               padding: EdgeInsets.symmetric(vertical: 15.0.h),
//               child: ListView.builder(
//                   itemCount:
//                       homeCubit.productsModel!.products.productsList.length,
//                   shrinkWrap: true,
//                   physics: const BouncingScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     final product =
//                         homeCubit.productsModel!.products.productsList[index];
//                     return Padding(
//                       padding: EdgeInsets.only(bottom: 12.h),
//                       child: CustomSubCategoryCard(
//                         description: "",
//                         backgroundImage: product.productImage,
//                         buttonText: product.productName,
//                         badgeBackgroundColor: Colors.black.withOpacity(0.5),
//                         badgeWidget: Text(
//                           product.productName.toUpperCase(),
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 19.sp,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         onTap: () {
//                           homeCubit.getProductDetails(product.productId);
//                           if (state is LoadingGetProductDetailsStates) {
//                             MyDialog.showLoadingDialog();
//                           } else if (state is SuccessGetProductDetailsStates) {
//                             EasyLoading.dismiss();
//                             context.push(
//                               ProductDetailsScreen(
//                                   //  brandName: brandName,
//                                   ),
//                             );
//                           } else if (state is ErrorGetProductDetailsStates) {
//                             EasyLoading.dismiss();
//                             debugPrint(
//                                 "============= Error get product details ===============");
//                           }
//                         },
//                       ),
//                     );
//                   }),
//             ),
//           );
//         });
//   }
// }
