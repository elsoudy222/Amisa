import 'package:amisa/core/components/custom_appbars/custom_products-appbar.dart';
import 'package:amisa/core/components/custom_sub_category_card/custom_sub_category_card.dart';
import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/core/const/extensions.dart';
import 'package:amisa/view/screens_path.dart';

import '../product_details/product_details_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomProductAppbar(
        title: "LUBE Modern kitchens",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0.h),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, i) {
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: CustomSubCategoryCard(
                description: "",
                backgroundImage: ceramics,
                onTap: (){
                 // context.push(ProductDetailsScreen());
                },
                buttonText: "Show OLTRE",
                badgeBackgroundColor: Colors.black.withOpacity(0.5),
                badgeWidget: Text(
                  "olter".toUpperCase(),
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
  }
}
