import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/const/app_strings.dart';

class CustomSubCategoryAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(sizeHeight.h);

  final double sizeHeight;
  final String title;
  final String imageUrl;
  final String description;
  FontWeight? fontWeight;
  bool center;

  CustomSubCategoryAppBar({
    super.key,
    this.sizeHeight = 280,
    this.center = true,
    this.title = "",
    this.fontWeight,
    required this.imageUrl,
    required this.description,
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
                "$baseImage$imageUrl",
              ),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          Positioned(
            bottom: 10.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 20.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Montserrat-Black"),
                        ),
                      ),
                       const Image(
                        image: AssetImage(line),

                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15.h, left: 15.w),
                    width: 280.w,
                    child: Text(
                      description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontFamily: "Montserrat-Black",
                      ),
                    ),
                  )
                ],
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
              icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),),
          ),
        ],
      ),
    );
  }
}

//used to make appbar in most of project
