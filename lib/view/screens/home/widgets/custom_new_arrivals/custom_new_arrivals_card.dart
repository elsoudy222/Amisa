import 'package:amisa/view/screens_path.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../view_model/database/network/end_points.dart';

class CustomNewArrivalsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final BoxFit fit;

  const CustomNewArrivalsCard({
    super.key,
    required this.title,
    required this.subtitle, required this.image,
     this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0.w),
      child: SizedBox(
        height: 160.h,
        width: 260.w,
        child: Column(
          children: [
          Container(
          height: 120.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider("$baseImage$image",),fit:fit,)
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 6.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title.toUpperCase(),
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}
