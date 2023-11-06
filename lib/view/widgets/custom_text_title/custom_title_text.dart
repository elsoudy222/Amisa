

import 'package:amisa/view/screens_path.dart';

Widget customTitleText({
  required String title,
   double fontSize = 20.0,
  FontWeight fontWeight = FontWeight.w600,
}){

  return Text(
    title.toUpperCase(),
    style: TextStyle(
        fontSize: fontSize.sp,
        color: Colors.white,
        fontWeight: fontWeight,
      fontFamily: "Montserrat"
    ),
  );
}