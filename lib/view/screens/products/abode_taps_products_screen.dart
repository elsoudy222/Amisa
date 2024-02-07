import 'package:amisa/core/components/custom_appbars/custom_products-appbar.dart';
import 'package:amisa/core/components/custom_sub_category_card/custom_sub_category_card.dart';
import 'package:amisa/core/const/extensions.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:amisa/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../core/components/components.dart';
import '../../../core/components/toast/toast.dart';
import '../product_details/product_details_screen.dart';

class AbodeTapsProductScreen extends StatelessWidget {


  const AbodeTapsProductScreen({
    super.key,

  });

  @override
  Widget build(context) {
    var homeCubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is LoadingGetProductDetailsStates) {
            MyDialog.showLoadingDialog();
          }
          else if (state is SuccessGetProductDetailsStates) {
            EasyLoading.dismiss();
            context.push(
              const ProductDetailsScreen(),
            );
          }
          else if (state is ErrorGetProductDetailsStates) {
            EasyLoading.dismiss();
            showErrorToast(
              context,
              msg: "Check your internet connection!",
              time: 3,
            );
            debugPrint(
                "============= Error get product details ===============");
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: CustomProductAppbar(
              title: "Abode taps".toUpperCase(),

            ),
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0.h),
              child: ListView.builder(
                  itemCount:
                  homeCubit.productsModel!.products.productsList.length ,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final product =
                    homeCubit.productsModel!.products.productsList[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: CustomSubCategoryCard(
                        description: "",
                        backgroundImage: product.productImage,
                        buttonText: product.productName,
                        badgeBackgroundColor: Colors.black.withOpacity(0.5),
                        badgePadding:  0 ,
                        badgeWidth:  250 ,
                        badgeWidget: Text(
                          product.productName.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        onTap: () {
                          homeCubit.getProductDetails(product.productId);

                        },
                      ),
                    );
                  }),
            ),
          );
        });
  }
}
