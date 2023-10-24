

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/config_path.dart';
import '../../screens_path.dart';

class CustomShowAllButton extends StatelessWidget {
  final VoidCallback onTap;
  const CustomShowAllButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 330.w,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Show All".toUpperCase(),
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
