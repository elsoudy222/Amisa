

import 'package:amisa/view/screens_path.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customTitleText({
  required String title,
}){

  return Text(
    title.toUpperCase(),
    style: TextStyle(
        fontSize: 20.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold
    ),
  );
}