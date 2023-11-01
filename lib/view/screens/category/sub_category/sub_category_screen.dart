import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/view/screens/category/kitchens_type/kitchens_sub_category_type.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/custom_appbars/custom_sub_category_appbar.dart';
import '../../../../core/components/custom_sub_category_card/custom_sub_category_card.dart';

class SubCategoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categoryCard = [
    {
      'companyLogo': lubeLogo,
      'name': "lube",
    },
    {
      'companyLogo': creoLogo,
      'name': "creo",
    },
    {
      'companyLogo': lubeLogo,
      'name': "lube",
    },
  ];

  SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSubCategoryAppBar(
        title: "Kitchens",
        imageUrl: kitchen,
        description:
            "The Number One Italian Kitchen Company You Will Find Here.",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0.h),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: categoryCard.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: CustomSubCategoryCard(
                badgeWidget: Image(
                  image: AssetImage(
                    categoryCard[i]["companyLogo"],
                  ),
                ),
                backgroundImage: ceramics,
                description: '',
                buttonText: 'Show ${categoryCard[i]["name"]}',
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    // this will need to pass The name and ID for the company :
                    return KitchensSubCategoryType(
                      companyName: categoryCard[i]["name"],
                      companyLogo: categoryCard[i]["companyLogo"],
                    );
                  }));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
