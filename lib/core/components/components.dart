import 'package:amisa/core/config/config_path.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../view/screens_path.dart';

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
      indicator: const Column(
        children: [
          Image(image: AssetImage(appLogo,),height: 70,),
          CircularProgressIndicator.adaptive(backgroundColor: Colors.white,strokeWidth: 2,),
        ],
      ),
      status: "loading..",
    );
  }
}
