

import '../../../../screens_path.dart';


class AbodeBrandTypes extends StatelessWidget {
  final String companyName;
  final String categoryName;
  final String companyImage;
  final String companyLogo;
  final int brandId;
  final String brandDescription;

  const AbodeBrandTypes(
      {super.key,
      required this.companyName,
      this.companyLogo = "",
      required this.brandId,
      required this.companyImage,
      required this.categoryName,
      required this.brandDescription});

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is LoadingGetAbodeTapsProductsStates
           ) {
          MyDialog.showLoadingDialog();
        }
        else if (state is SuccessGetAbodeTapsProductsStates
            //&& homeCubit.productsModel!.products.type == "Taps"
            //  && homeCubit.productsModel!.products.type != "3in1"
            //  && homeCubit.productsModel!.products.type != "4in1"
        ){
          EasyLoading.dismiss();
          context.push(
            const AbodeTapsProductScreen(),
          );
          debugPrint("++++++++++++++++++++($companyName)++++++++++++++++++++++++++++");
        }
        else if (state is ErrorGetAbodeTapsProductsStates

        ) {
          EasyLoading.dismiss();
          showErrorToast(
            context,
            msg: "There is no products yet!",
            time: 3,
          );
          debugPrint(
              "================================ ERROR =======================================");
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomKitchensTypeAppbar(
            title: companyName,
            imageUrl: companyImage,
            companyLogo: companyLogo,
          ),
          body: Column(
            children: [
              // Section 1 :
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Image(image: AssetImage(line)),
                    SizedBox(
                      width: 280.w,
                      child: Text(
                        brandDescription,
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300,
                          //fontFamily: "Montserrat-Black"
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              customTitleText(
                title: "What do you looking for ?",
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              SizedBox(
                height: 12.h,
              ),

              SizedBox(
                height: 20.h,
              ),

              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.w,
                  ),
                  itemCount: homeCubit.abodeTypes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomKitchenTypeCard(
                      /// will change the image:
                      backgroundImage: homeCubit.abodeTypesImage[index],
                      title: homeCubit.abodeTypes[index],
                      onTap: () {
                        if (homeCubit.abodeTypes[index] != "Taps") {
                          context.push(
                            AbodePronteauTypes(
                              brandId: brandId,
                              companyImage: companyImage,
                              categoryName: categoryName,
                              brandDescription: brandDescription,
                            ),
                          );
                          debugPrint(homeCubit.abodeTypes[index]);
                        }
                        else {
                          homeCubit.getAbodeTapsProducts(brandId: "$brandId",);

                          debugPrint(homeCubit.abodeTypes[index]);
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
