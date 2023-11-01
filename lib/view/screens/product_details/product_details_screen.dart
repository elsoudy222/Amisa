import 'package:amisa/core/config/config_path.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../screens_path.dart';

class ProductDetailsScreen extends StatelessWidget {
  List<String> categoryImage = [header, ceramics, header1, newArrivals, news];
  ProductDetailsScreen({super.key});

PageController imageController =PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TITLE"),
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
      body: Column(
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
                  itemBuilder: (context, index) => Image(
                    image: AssetImage(ceramics,),
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

                    type: WormType.thin),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding:  EdgeInsets.all(15.0.r),
            child: Column(
              children: [
                Text(
                  "Home > Kitchens > Modern Kitchens > Oltre",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ],
            ),
          )


        ],
      ),
    );
  }
}
