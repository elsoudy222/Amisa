import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/core/const/extensions.dart';
import 'package:amisa/view/screens/category/kitchens_type/widgets/custom_kitchen-Type_card.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:amisa/view/widgets/custom_text_title/custom_title_text.dart';
import 'package:amisa/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../core/components/components.dart';
import '../../../../core/components/custom_appbars/custom_kitchen_type_appbar.dart';
import '../../../../core/config/const/enums.dart';
import '../../products/products_screen.dart';

class KitchensSubCategoryType extends StatelessWidget {
  final String companyName;
  final String categoryName;
  final String companyImage;
  final String companyLogo;
  final String? brandId;

  String modern = KitchenTypes.modern.toString();
  String classic = KitchenTypes.classic.toString();

  KitchensSubCategoryType(
      {super.key,
      required this.companyName,
      this.companyLogo = lubeLogo,
      this.brandId,
      required this.companyImage, required this.categoryName});

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
          print("2 ============= ${homeCubit.productsModel!.products.type} =============");
          print("$brandId");
        } else if (state is ErrorGetAllProductsStates) {
          EasyLoading.dismiss();
          print(
              "================================ ERROR =======================================");
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomKitchensTypeAppbar(
            title: companyName,
            imageUrl: kitchen,
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
                        "Lube leads the Italian kitchen market, harmonizing design and innovation, and delivering exceptional quality and customer care.",
                        textAlign: TextAlign.start,
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
                  itemCount: homeCubit.kitchen.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomKitchenTypeCard(
                      /// will change the image:
                      backgroundImage: header,
                      title: homeCubit.kitchen[index],
                      onTap: () {


                        homeCubit.getAllProducts(
                          brandId: "$brandId",
                          type: homeCubit.kitchen[index],
                         // pageNumber: "1"
                        );
                        print(homeCubit.kitchen[index]);
                        // print("TYPE: =====${homeCubit.productsModel!.products.type[index]}");
                        //context.push(const ProductsScreen());
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
