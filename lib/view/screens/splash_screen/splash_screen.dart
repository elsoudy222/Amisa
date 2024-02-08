
import 'package:amisa/screens_path.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? onBoarding = CacheHelper.get(key: 'onBoarding');
  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      if (onBoarding != null) {
        context.pushReplacement(const LayoutScreen(),);
      }else{
        context.pushReplacement(OnBoardingScreen(),);
      }

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Image(
              image: AssetImage(
                appLogo,
              ),

            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "THE LUXURY DESTINATION",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20.h,
            ),
             CircularProgressIndicator.adaptive(),
          ],
        ),
      ),
    );
  }
}
