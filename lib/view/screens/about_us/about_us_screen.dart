import 'package:amisa/view/screens_path.dart';
import 'package:amisa/view/widgets/custom_text_title/custom_title_text.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "About Amisa",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body:  SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AboutUsCustomCard(
              text: aboutUsText,
            ),
            SizedBox(height: 25.h,),
            customTitleText(title: "Our Vision"),
            AboutUsCustomCard(
              text: ourVisionText,
            ),
          ],
        ),
      ),
    );
  }
}

const String aboutUsText ="Amisa Group has been successfully providing solutions for all types of building materials work for architects and the construction industry in large quantities. This has enabled the Group to be a strong competitor to major companies, due to the efforts put in by the management, in developing and strengthening the company as a whole";
const String ourVisionText ="To continuously touch people’s lives in UAE and Middle East by providing quality service and products. To focus on the satisfaction of our clients, build their trust on our products and keep on progressing in our services. At Amisa we pride in our ability to provide Elegance, Superiority and Stability in all aspects of our business. Our core vision is to see our company progress and stand above its triumphant years.";

class AboutUsCustomCard extends StatelessWidget {
  final String text;
  const AboutUsCustomCard({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330.w,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.sp,fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
