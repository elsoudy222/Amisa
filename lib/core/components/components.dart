import 'package:lottie/lottie.dart';
import '../../../screens_path.dart';


Widget customCircularProgressIndicator() {
  return const Center(
    child: CircularProgressIndicator.adaptive(
      strokeWidth: 2,
      backgroundColor: Colors.white,
    ),
  );
}

class MyDialog{

  static showLoadingDialog() {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: false,
      indicator:  Column(
        children: [
          const Image(image: AssetImage(appLogo,),height: 70,),
          Lottie.asset(loadingLotti,height: 50.h,),
         // CircularProgressIndicator.adaptive(backgroundColor: Colors.white,strokeWidth: 2,),
        ],
      ),
      status: "loading..",
    );
  }
}
