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
      maskType: EasyLoadingMaskType.none,
      dismissOnTap: false,
      indicator: CircularProgressIndicator.adaptive(backgroundColor: Colors.white,),
      status: "loading",
    );
  }
}
