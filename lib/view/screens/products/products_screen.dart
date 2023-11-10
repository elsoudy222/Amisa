import 'package:amisa/core/components/custom_appbars/custom_products-appbar.dart';
import 'package:amisa/core/components/custom_sub_category_card/custom_sub_category_card.dart';
import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/core/const/extensions.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:amisa/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:amisa/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../product_details/kitchen_product_details/kitchen_product_details_screen.dart';

class ProductsScreen extends StatelessWidget {
  final String type;
  final String brandName;

  const ProductsScreen(
      {super.key, required this.type, required this.brandName});

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomProductAppbar(
            title: "LUBE $type kitchens".toUpperCase(),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0.h),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: homeCubit.productsModel!.products.productsList.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: CustomSubCategoryCard(
                    description: "",
                    backgroundImage: homeCubit.productsModel!.products.productsList[i].productImage,
                    onTap: () {
                      context.push(KitchensProductDetailsScreen());
                    },
                    buttonText: "${homeCubit.productsModel!.products.productsList[i].productName}",
                    badgeBackgroundColor: Colors.black.withOpacity(0.5),
                    badgeWidget: Text(
                      "${homeCubit.productsModel!.products.productsList[i].productName}".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              },
            ),
          ),


        );
      },
    );
  }
}
