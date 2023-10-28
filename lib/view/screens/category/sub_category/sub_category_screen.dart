import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_category_card/custom_category_card.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300.h),
        child: Container(
          height: 300.h,
          decoration: BoxDecoration(

            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.dstATop),
                image: AssetImage(kitchen),
                fit: BoxFit.cover)
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.0.w,vertical: 20.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RotatedBox(
                      quarterTurns: -1,
                      child: Text("Kitchens",style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500
                      ),),
                    ),
                    Image(image: AssetImage(line),),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15.h,left: 15.w),
                  width: 280.w,
                  child: Text(
                    "The Number One Italian Kitchen Company You Will Find Here.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,

                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 15.0.h),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: categoryCard.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: CustomCategoryCard(

                badgeWidget: Image(
                  image: AssetImage(categoryCard[i]["companyLogo"],),
                ),

                backgroundImage: ceramics,
                description: '',
                buttonText: 'Show ${categoryCard[i]["name"]}',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return SubCategoryScreen();
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
