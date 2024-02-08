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
      indicator: const Column(
        children: [
          Image(image: AssetImage(appLogo,),height: 70,),
          SizedBox(height: 10,),
          CircularProgressIndicator.adaptive(backgroundColor: Colors.white,strokeWidth: 2,),
        ],
      ),
      status: "loading..",
    );
  }
}
