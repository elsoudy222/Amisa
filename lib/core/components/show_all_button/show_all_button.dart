import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/config_path.dart';
import '../../../view/screens_path.dart';

class CustomShowAllButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const CustomShowAllButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 330.w,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            const Image(image: AssetImage(arrow2),)
          ],
        ),
      ),
    );
  }
}
