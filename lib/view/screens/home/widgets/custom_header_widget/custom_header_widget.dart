
import '../../../../../core/config/const/app_strings.dart';
import '../../../../screens_path.dart';

class CustomHeaderWidget extends StatelessWidget {
  const CustomHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.dstATop),

          /// This Image will be changes :--------------
          image: const AssetImage(header1),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 30.w,
            bottom: 30.h,
            child: Row(
              children: [
                SizedBox(
                  //height: 70.h,
                  width: 220.w,
                  child: const Text(
                    "THE LUXURY\nDESTINATION",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 75.w,
                ),
                // InkWell(
                //   onTap: () {
                //     print(
                //         " **************** (Tapped) ****************");
                //
                //   },
                //   child: Container(
                //     height: 50.h,
                //     width: 50.h,
                //     decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         color: Colors.white.withOpacity(.2)),
                //     child: Icon(
                //       Icons.arrow_forward_ios_rounded,
                //       color: Colors.white,
                //       size: 25.sp,
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          /// LOGO : ---------------
          Positioned(
            top: 55.h,
            left: 160.w,
            right: 160.w,
            child: Image(
              image: const AssetImage(appLogo),
              height: 65.h,
              width: 70.w,
            ),
          ),
        ],
      ),
    );
  }
}