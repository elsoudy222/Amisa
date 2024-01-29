import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/core/const/extensions.dart';
import 'package:amisa/view/screens/category/kitchens_type/widgets/custom_kitchen-Type_card.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:amisa/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../../core/components/components.dart';
import '../../../../core/components/custom_appbars/custom_kitchen_type_appbar.dart';
import '../../../../core/components/toast/toast.dart';
import '../../../../core/config/const/enums.dart';
import '../../home/widgets/custom_text_title/custom_title_text.dart';
import '../../products/products_screen.dart';
import '../abode_pronteau_types/abode_pronteau_types.dart';

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
        if (state is LoadingGetAllProductsStates &&
            homeCubit.productsModel!.products.type != "3 in 1" &&
            homeCubit.productsModel!.products.type != "4 in 1") {
          MyDialog.showLoadingDialog();
        } else if (state is SuccessGetAllProductsStates &&
            homeCubit.productsModel!.products.type != "3 in 1" &&
            homeCubit.productsModel!.products.type != "4 in 1") {
          EasyLoading.dismiss();
          context.push(
            ProductsScreen(
              type: homeCubit.productsModel!.products.type,
              brandName: companyName,
              categoryName: categoryName,
            ),
          );
        } else if (state is ErrorGetAllProductsStates &&
            homeCubit.productsModel!.products.type != "3 in 1" &&
            homeCubit.productsModel!.products.type != "4 in 1") {
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
                  itemCount: homeCubit.kitchenTypes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomKitchenTypeCard(
                      /// will change the image:
                      backgroundImage: homeCubit.abodeTypesImage[index],
                      title: homeCubit.abodeTypes[index],
                      onTap: () {
                        if (homeCubit.abodeTypes[index] == "Pronteau") {
                          context.push(
                            AbodePronteauTypes(
                              companyName: companyName,
                              brandId: brandId,
                              companyImage: companyImage,
                              categoryName: categoryName,
                              brandDescription: brandDescription,
                            ),
                          );
                          debugPrint(homeCubit.abodeTypes[index]);
                        } else {
                          homeCubit.getAllProducts(
                            brandId: "$brandId",
                            type: homeCubit.abodeTypes[index],
                          );
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
