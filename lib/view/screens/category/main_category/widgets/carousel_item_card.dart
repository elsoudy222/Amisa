

import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../screens_path.dart';

Widget carouselItemCard({
  required String image,
  required String title,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      //margin: EdgeInsets.all(20.r),
      width: 290.w,
      height: 430.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.w),
        image: DecorationImage(image: CachedNetworkImageProvider("$baseImage$image",), fit: BoxFit.cover),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
          height: 66.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(25.w))),
          child: Center(
            child: Text(
              title.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 23.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        )
      ]),
    ),
  );
}