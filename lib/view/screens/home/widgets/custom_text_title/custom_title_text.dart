

import 'package:amisa/screens_path.dart';

Widget customTitleText({
  required String title,
   double fontSize = 20.0,
  FontWeight fontWeight = FontWeight.w600,
}){

  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 10,
        ),
      ],

    ),
    child: Text(
      title.toUpperCase(),
      style: TextStyle(
          fontSize: fontSize.sp,
          color: Colors.white,
          fontWeight: fontWeight,
        fontFamily: "Montserrat"
      ),
    ),
  );
}