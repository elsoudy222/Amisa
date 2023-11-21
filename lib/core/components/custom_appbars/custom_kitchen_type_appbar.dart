import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view/screens_path.dart';
import '../../../view_model/database/network/end_points.dart';
import '../../config/const/app_strings.dart';

class CustomKitchensTypeAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(sizeHeight.h);

  final double sizeHeight;
  final String title;
  final String imageUrl;
  final String companyLogo;

  FontWeight? fontWeight;
  bool center;

  CustomKitchensTypeAppbar({
    super.key,
    this.sizeHeight = 320,
    this.center = true,
    this.title = " ",
    this.fontWeight,
    required this.imageUrl,
    required this.companyLogo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeHeight.h,
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.dstATop,
              ),
              image: CachedNetworkImageProvider(
                baseImage+imageUrl,
              ),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          Positioned(
            bottom: 10.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 20.h),
              child: Image(
               image: NetworkImage("$baseImage$companyLogo"),
               height: 81.h,
               width: 81.h,
               fit: BoxFit.contain,
                  ),
            ),
          ),
          Positioned(
            top: 40.h,
            left: 20.w,
            child: IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),),
          ),
          Positioned(
            top: 50.h,
            left: ScreenUtil.defaultSize.width / 2.0,
            child:   Text(
              title.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Montserrat-Black"),
            ),
          ),
        ],
      ),
    );
  }}
