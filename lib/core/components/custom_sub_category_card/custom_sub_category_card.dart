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
  final int badgeHeight;
  final int badgeWidth;
  final double badgePadding;

  const CustomSubCategoryCard({
    super.key,
    required this.description,
    required this.backgroundImage,
    required this.onTap,
    required this.buttonText,
    required this.badgeWidget,
    this.badgeBackgroundColor = Colors.transparent,
     this.badgeHeight = 120,
     this.badgeWidth= 120,
     this.badgePadding = 30.0,
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
          image: CachedNetworkImageProvider(
            "$baseImage$backgroundImage",
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          // Category Badge :
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: badgePadding.w),
                child: Container(
                  height: badgeHeight.h,
                  width: badgeWidth.w,
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

                        /// //////////////////////////////////
                        color: Colors.black.withOpacity(0.0),
                        border: Border.all(color: Colors.white, width: .5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 270.w,
                          child: Center(
                            child: Text(
                              buttonText.toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              // maxLines: 1,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Image(
                          image: AssetImage(arrow),
                          width: 20,
                        )
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
