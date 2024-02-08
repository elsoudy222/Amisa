
import 'package:amisa/screens_path.dart';


class KitchensSubCategoryType extends StatelessWidget {
  final String companyName;
  final String categoryName;
  final String companyImage;
  final String companyLogo;
  final int? brandId;
  final String brandDescription;

  const KitchensSubCategoryType(
      {super.key,
      required this.companyName,
      this.companyLogo = "",
      this.brandId,
      required this.companyImage,
      required this.categoryName,
      required this.brandDescription});

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is LoadingGetAllProductsStates) {
          MyDialog.showLoadingDialog();
        } else if (state is SuccessGetAllProductsStates) {
          EasyLoading.dismiss();
          context.push(
            ProductsScreen(
              type: homeCubit.productsModel!.products.type,
              brandName: companyName,
              categoryName: categoryName,
            ),
          );
        } else if (state is ErrorGetAllProductsStates) {
          EasyLoading.dismiss();
          showErrorToast(
            context,
            msg: "There is no products yet!",
            time: 3,
          );
          print(
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
                title: "What kind of person you’re?",
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
                  itemCount: homeCubit.kitchenTypes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomKitchenTypeCard(
                      /// will change the image:
                      backgroundImage: homeCubit.kitchenTypesImage[index],
                      title: homeCubit.kitchenTypes[index],
                      onTap: () {
                        homeCubit.getAllProducts(
                          brandId: "$brandId",
                          type: homeCubit.kitchenTypes[index],
                        );
                        print(homeCubit.kitchenTypes[index]);
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
