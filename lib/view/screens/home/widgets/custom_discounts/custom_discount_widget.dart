import 'package:amisa/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:amisa/view_model/cubits/layout_cubit/layout_cubit.dart';
import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../screens_path.dart';

class CustomDiscountWidget extends StatelessWidget {


  const CustomDiscountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var layoutCubit = LayoutCubit.get(context);
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding:  EdgeInsets.only(top: 15.0.h),
          child: CarouselSlider(
            items: List.generate(
             layoutCubit.homeModel!.ads.length,
                  (index) => Container(
                height: 180.h,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  image: DecorationImage(

                    image: CachedNetworkImageProvider("$baseImage${layoutCubit.homeModel!.ads[index].photo}"),
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
