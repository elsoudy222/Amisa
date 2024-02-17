import 'package:amisa/screens_path.dart';


class CustomDiscountWidget extends StatelessWidget {


  const CustomDiscountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding:  EdgeInsets.only(top: 15.0.h),
          child: CarouselSlider(
            items: List.generate(
             homeCubit.homeModel!.ads.length,
                  (index) => Container(
                height: 180.h,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  image: DecorationImage(

                    image: CachedNetworkImageProvider("$baseImage${homeCubit.homeModel!.ads[index].photo}"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            options: CarouselOptions(
                height: 180.h,
                //aspectRatio: 11 / 4,
                viewportFraction: .92,
                autoPlay: true,
                enableInfiniteScroll: true,
            ),
          ),
        );
      },
    );
  }
}
