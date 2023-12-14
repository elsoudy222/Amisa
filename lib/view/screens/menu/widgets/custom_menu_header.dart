import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/const/app_strings.dart';


// ignore: must_be_immutable
class CustomMenuHeaderWidget extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(sizeHeight.h);

  final double sizeHeight;
  final String title;
  final String imageUrl;

  FontWeight? fontWeight;
  bool center;

  CustomMenuHeaderWidget({
    super.key,
    this.sizeHeight = 270,
    this.center = true,
    this.title = "",
    this.fontWeight,
    required this.imageUrl,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeHeight.h,
      decoration: BoxDecoration(
       borderRadius: BorderRadius.vertical(bottom: Radius.circular(25.r)),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.dstATop,
              ),
              image: AssetImage(
                imageUrl,
              ),
              fit: BoxFit.cover)),
      child:  Center(
        child: Image(
          image: const AssetImage(appLogo,),
          fit: BoxFit.contain,
          height: 100.h,
          width: 100.w,
        ),
      ),
    );
  }
}

//used to make appbar in most of project
