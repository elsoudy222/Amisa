import 'package:amisa/view/screens/about_us/widgets/about_us_wigdet.dart';
import 'package:amisa/view/screens_path.dart';

import '../../../core/config/const/app_strings.dart';
import '../home/widgets/custom_text_title/custom_title_text.dart';

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
              customTitleText(title: "Our Vision"),
              const AboutUsCustomCard(
                text: ourVisionText,
              ),
              SizedBox(height: 25.h,),
              const Divider(),
              customTitleText(title: "Our Mission"),
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


