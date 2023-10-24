import 'package:amisa/view/screens_path.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/const/app_strings.dart';

class CustomNewArrivalsCard extends StatelessWidget {
  const CustomNewArrivalsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 15.0.w),
      child: SizedBox(
        height: 150.h,
        width: 260.w,

        child: Column(
          children: [
            Container(
              height: 120.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(newArrivals),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "LUBE",
                    style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                  Text(
                    "OLTRE",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}