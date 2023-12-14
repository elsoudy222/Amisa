import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../view_model/cubits/layout_cubit/layout_cubit.dart';
import '../../../screens_path.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
    required this.cubit,
    required this.leadingIcon,
    required this.title,
    required this.subtitle,
    required this.expansionBody,

  });

  final LayoutCubit cubit;
  final IconData leadingIcon;
  final String title;
  final String subtitle;



  final List<Widget> expansionBody;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      leading: Icon(
        leadingIcon,
        color: Colors.white,
      ),
      trailing: Icon(
        cubit.expansionIcon ? IconlyBold.arrowUp3 : IconlyBold.arrowDown3,
        color: Colors.white,
      ),
      onExpansionChanged: (bool expanded){
        cubit.changeExpansionTileIcon(expanded);
      },
      subtitle: Padding(
        padding: EdgeInsets.only(
          left: 10.0.w,
        ),
        child: Text(
          subtitle,
          style: TextStyle(
              color: Colors.white38,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp),
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(left: 10.0.w),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 18.sp),
        ),
      ),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: expansionBody,
        ),
      ],
    );
  }
}