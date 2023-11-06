import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/view/screens/home/widgets/custom_new_arrivals/custom_new_arrivals_card.dart';
import 'package:amisa/view/widgets/custom_text_title/custom_title_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../collection_screen.dart';
import '../../../screens_path.dart';

class KitchensProductDetailsScreen extends StatelessWidget {
   KitchensProductDetailsScreen({super.key});

  final PageController imageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Model title"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 290.h,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: imageController,
                    itemBuilder: (context, index) => const Image(
                      image: AssetImage(
                        ceramics,
                      ),
                      fit: BoxFit.cover,
                    ),
                    itemCount: 5,
                    allowImplicitScrolling: true,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SmoothPageIndicator(
                  controller: imageController,
                  count: 5,
                  effect: const WormEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.white,
                      dotWidth: 25,
                      dotHeight: 4,
                      spacing: 3,
                      type: WormType.thin,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Screen Path :
                    const Text(
                      "Home > Kitchens > Modern Kitchens > Oltre",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Model Title : ",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      // color: Colors.orange,
                      width: double.infinity,

                      child: Text(
                        "Description :\n\nOltre offers rigorous lines and a rich essence, with many different finishes, details and accessories that make it unique in its genre. There are many colours and materials available, all designed to blend together elegantly to create a refined and exclusive look, such as doors with cement-effect hand-applied mortar and those with highly tactile wood veneer. ",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: const AssetImage(line),
                            height: 60.h,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 15.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Plinth",
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        "Line",
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Plinth",
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        "Line",
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Plinth",
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        "Line",
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    customTitleText(title: "DESIGN COLLECTIONS"),
                    SizedBox(
                      height: 15.h,
                    ),
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
                                  return CollectionsScreen();
                                },
                              ),
                            );
                          },
                            child:  CustomNewArrivalsCard(title: "Collection 1", subtitle: "", image: '',));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
