


import '../../../../screens_path.dart';

class SocialLinksWidget extends StatelessWidget {
  final Uri uri;
  final String imageUrl;
  const SocialLinksWidget({
    super.key, required this.uri, required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Link(
      target: LinkTarget.blank,
      uri: uri,
      builder: (context , followLink){
        return InkWell(
          onTap: followLink,
          child: SvgPicture.asset(imageUrl,height: 25.h,),
        );
      },
    );
  }
}