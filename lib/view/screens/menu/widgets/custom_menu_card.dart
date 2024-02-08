
import '../../../../screens_path.dart';

class CustomMenuCard extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String title;



  const CustomMenuCard({
    super.key,
    required this.title, required this.icon, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  Icon(icon,color: Colors.white,),
      title: Padding(
        padding:  EdgeInsets.only(left: 10.0.w),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 18.sp
          ),
        ),
      ),
      trailing: const Icon(IconlyBold.arrowRight3,color: Colors.white,),
      onTap: onTap,
    );
  }
}