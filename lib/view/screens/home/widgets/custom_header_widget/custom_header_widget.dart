 import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../../../core/config/const/app_strings.dart';
import '../../../../screens_path.dart';

class CustomHeaderWidget extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(sizeHeight.h);

  int sizeHeight = 300;
  List<String> imageHeader = [
    header,
    newArrivals,
    news,
    ceramics,
    kitchen,
  ];

  CustomHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeHeight.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25.r)),
      ),
      child: Stack(
        children: [
          CarouselSlider(
            items: List.generate(
              imageHeader.length,
              (index) => Container(
                height: sizeHeight.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30.r)),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.7), BlendMode.dstATop),
                    image: AssetImage(imageHeader[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            options: CarouselOptions(
                height: sizeHeight.h,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                autoPlay: true,
                enableInfiniteScroll: true),
          ),
          Positioned(
            left: 30.w,
            bottom: 30.h,
            child: Row(
              children: [
                SizedBox(
                  //height: 70.h,
                  width: 220.w,
                  child:  Text(
                    "THE LUXURY\nDESTINATION",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                // SizedBox(
                //   width: 350.0,
                //   child: DefaultTextStyle(
                //     style: const TextStyle(
                //       fontSize: 30.0,
                //      // fontFamily: 'Agne',
                //     ),
                //     child: AnimatedTextKit(
                //       animatedTexts: [
                //         TypewriterAnimatedText('THE LUXURY DESTINATION'),
                //
                //       ],
                //       onTap: () {
                //         print("Tap Event");
                //       },
                //     ),
                //   ),
                // ),
                SizedBox(
                  width: 75.w,
                ),
              ],
            ),
          ),

          /// LOGO : ---------------
          Positioned(
            top: 55.h,
            left: 160.w,
            right: 160.w,
            child: Image(
              image: const AssetImage(appLogo),
              height: 95.h,
              width: 70.w,
            ),
          ),

          /// Kitchen and Ceramics
          // Positioned(
          //   top: 135.h,
          //   left: 50.w,
          //   child: const Text(
          //     "Kitchens & Ceramics",
          //     textAlign: TextAlign.start,
          //     style: TextStyle(
          //         fontSize: 30,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.white),
          //   ),
          // ),
        ],
      ),
    );
  }
}
