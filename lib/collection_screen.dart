// import 'package:amisa/core/config/config_path.dart';
// import 'package:amisa/view/screens/category/sub_category/sub_category_screen.dart';
// import 'package:amisa/view/screens_path.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'core/components/custom_sub_category_card/custom_sub_category_card.dart';
// import 'core/config/const/app_strings.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final List<Map<String, dynamic>> categoryCard = [
//     {
//       'companyLogo': lubeLogo,
//       'name': "lube",
//     },
//     {
//       'companyLogo': creoLogo,
//       'name': "creo",
//
//     },
//     {
//       'companyLogo': lubeLogo,
//       'name': "lube",
//     },
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             pinned: true,
//             expandedHeight: 300.h ,
//             collapsedHeight: 200.h,
//             floating: true,
//             backgroundColor: Colors.transparent,
//             flexibleSpace:   FlexibleSpaceBar(
//               expandedTitleScale: 1 ,
//               title:  Container(
//                 height: 300.h,
//
//                 child: Padding(
//                   padding:  EdgeInsets.symmetric(horizontal: 30.0.w,vertical: 20.h),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           RotatedBox(
//                             quarterTurns: -1,
//                             child: Text("Kitchens",style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 22.sp,
//                                 fontWeight: FontWeight.w500
//                             ),),
//                           ),
//                           Image(image: AssetImage(line)),
//                         ],
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(bottom: 15.h,left: 15.w),
//                         width: 280.w,
//                         child: Text(
//                           "The Number One Italian Kitchen Company You Will Find Here.",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20.sp,
//
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               centerTitle: true,
//               background: Container(
//                 color:  Colors.black.withOpacity(0.5),
//                 child: Image(
//                   image: AssetImage(kitchen,),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           SliverList(
//               delegate: SliverChildBuilderDelegate(
//             (context, index) {
//               return  Padding(
//                 padding:  EdgeInsets.symmetric(vertical: 15.0.h),
//                 child: Padding(
//                   padding: EdgeInsets.only(bottom: 12.h),
//                   child: CustomSubCategoryCard(
//
//                     badgeWidget: Image(
//                       image: AssetImage(categoryCard[index]["companyLogo"],),
//                     ),
//
//                     backgroundImage: ceramics,
//                     description: '',
//                     buttonText: 'Show ${categoryCard[index]["name"]}',
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(builder: (context){
//                         // this will need an ID :
//                         return SubCategoryScreen();
//                       }));
//                     },
//                   ),
//                 ),
//               );
//             },
//             childCount: categoryCard.length,
//             addAutomaticKeepAlives: false,
//           )),
//
//         ],
//       ),
//     );
//   }
// }

import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/photo_view.dart';
import 'package:amisa/view/screens/home/widgets/custom_new_arrivals/custom_new_arrivals_card.dart';
import 'package:amisa/view/screens_path.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: const Text("AppStrings.collections"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250.h,
              width: double.infinity,
              // color: Colors.grey,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    news,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap:  () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PhotoViewScreen();
                          },
                        ),
                      );
                    },
                    child: const CustomNewArrivalsCard(title: "", subtitle: ""));
              },
            ),
          ],
        ),
      ),
    );
  }
}
