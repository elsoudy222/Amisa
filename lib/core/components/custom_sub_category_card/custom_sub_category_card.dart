
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/config/config_path.dart';
import '../../../view/screens_path.dart';
import '../../../view_model/database/network/end_points.dart';

class CustomSubCategoryCard extends StatelessWidget {

  final Widget badgeWidget;
  final Color badgeBackgroundColor;
  final String description;
  final String buttonText;
  final String backgroundImage;
  final VoidCallback onTap;

  const CustomSubCategoryCard({
    super.key,
    required this.description,
    required this.backgroundImage,
    required this.onTap,
    required this.buttonText,
    required this.badgeWidget,
    this.badgeBackgroundColor = Colors.transparent,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.7), BlendMode.dstATop),

          /// This Image will be changes :--------------
          image: CachedNetworkImageProvider("$baseImage$backgroundImage",),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          // Category Badge :
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.0.w),
                child: Container(
                  height: 120.h,
                  width: 120.w,
                  color: badgeBackgroundColor,
                  child: Center(
                    child: badgeWidget,
                  ),
                ),
              ),
            ],
          ),

          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Small Description :
              SizedBox(
                width: 250.w,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0.h),
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    height: 40.h,
                    width: 330.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: .5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          buttonText.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Image(image: AssetImage(arrow))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
