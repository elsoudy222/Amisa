
import '../../../../screens_path.dart';

class AboutUsCustomCard extends StatelessWidget {
  final String text;
  const AboutUsCustomCard({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      //width: 340.w,
      // decoration: BoxDecoration(
      //    // color: Colors.grey,
      //    // border: Border.all(color: Colors.white,width: 1),
      //     borderRadius: BorderRadius.circular(30.r)
      // ),
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