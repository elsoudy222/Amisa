import 'package:amisa/view/screens_path.dart';
import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';

import 'core/config/const/app_strings.dart';

class PhotoViewScreen extends StatelessWidget {
  final String image;
  const PhotoViewScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
          child: PhotoView(
            imageProvider:  CachedNetworkImageProvider(baseImage+image),
            filterQuality:  FilterQuality.high,

          )
      ),
    );
  }
}
