import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/view/screens/category/kitchens_type/widgets/custom_kitchen-Type_card.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:amisa/view/widgets/custom_text_title/custom_title_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/custom_appbars/custom_kitchen_type_appbar.dart';

class KitchensSubCategoryType extends StatelessWidget {
  final String companyName;
  final String companyLogo;

  const KitchensSubCategoryType(
      {super.key, required this.companyName, required this.companyLogo});

  @override
  Widget build(BuildContext context) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomKitchenTypeCard(
                backgroundImage: header,
                title: 'modern',
                onTap: () {},
              ),
              CustomKitchenTypeCard(
                backgroundImage: ceramics,
                title: "classic",
                onTap: (){},
              )
            ],
          )
        ],
      ),
    );
  }
}


