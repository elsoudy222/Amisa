import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../screens_path.dart';

class CustomKitchenTypeCard extends StatelessWidget {
  final String backgroundImage;
  final String title;
  final VoidCallback onTap;

  const CustomKitchenTypeCard({
    super.key,
    required this.backgroundImage,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 220.h,
        width: 195.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              backgroundImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(97, 97, 97, 0.5),
            ),
            child: Center(
              child: Text(
                title.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}