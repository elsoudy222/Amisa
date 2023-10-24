import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/config_path.dart';
import '../../screens_path.dart';

class CustomCategoryCard extends StatelessWidget {
  final String categoryTitle;
  final String description;
  final String backgroundImage;
  final VoidCallback onTap;

  const CustomCategoryCard({
    super.key,
    required this.categoryTitle,
    required this.description,
    required this.backgroundImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.dstATop),

          /// This Image will be changes :--------------
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Text(
                      categoryTitle.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Spacer(),
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
                      fontWeight: FontWeight.w500,
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
                          "Shop Now".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
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


