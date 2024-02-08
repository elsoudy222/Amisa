import 'package:amisa/screens_path.dart';


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
                  homeCubit.aboutProductsModel!.products.productsList.length ,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final product =
                    homeCubit.aboutProductsModel!.products.productsList[index];
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
