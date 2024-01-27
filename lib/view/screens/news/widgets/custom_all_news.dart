
import '../../../../../view_model/database/network/end_points.dart';

import '../../../screens_path.dart';


class CustomAllNewsCard extends StatelessWidget {
  final String newsDesc;
  final String backgroundImage;

  const CustomAllNewsCard({
    super.key,
    required this.newsDesc,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 230.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.dstATop,
            ),
            /// This Image will be changes :--------------
            image: NetworkImage("$baseImage$backgroundImage"),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 105.h,
              width: 265.w,
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(12.0.h),
                  child: Text(
                    newsDesc,
                    textAlign: TextAlign.start,
                    maxLines: 4,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
