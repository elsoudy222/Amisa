import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/const/app_strings.dart';


class CustomMenuHeaderWidget extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(sizeHeight.h);

  final double sizeHeight;
  final String title;
  final String imageUrl;
  final String description;
  FontWeight? fontWeight;
  bool center;

  CustomMenuHeaderWidget({
    super.key,
    this.sizeHeight = 220,
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
              image: AssetImage(
                imageUrl,
              ),
              fit: BoxFit.cover)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(appLogo,),
              fit: BoxFit.contain,
              height: 100,
              width: 100,
            ),

          ],
        ),
      ),
    );
  }
}

//used to make appbar in most of project
