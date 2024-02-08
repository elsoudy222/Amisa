import 'package:amisa/screens_path.dart';


class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customTitleText(title: "About Amisa"),
      ),
      body:  SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AboutUsCustomCard(
                text: aboutUsText,
              ),
              SizedBox(height: 25.h,),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(vision),
                  SizedBox(width: 5.w,),
                  customTitleText(title: "Our Vision"),
                ],
              ),
              const AboutUsCustomCard(
                text: ourVisionText,
              ),
              SizedBox(height: 25.h,),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(mission),
                  SizedBox(width: 5.w,),
                  customTitleText(title: "Our Mission"),
                ],
              ),
              const AboutUsCustomCard(
                text: ourMissionText,
              ),
              SizedBox(height: 55.h,),
            ],
          ),
        ),
      ),
    );
  }
}


