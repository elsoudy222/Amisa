import 'package:amisa/view/screens_path.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';

import 'core/config/const/app_strings.dart';

class PhotoViewScreen extends StatelessWidget {
  const PhotoViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
          child: PhotoView(
            imageProvider: const CachedNetworkImageProvider(news),
            filterQuality:  FilterQuality.high,

          )
      ),
    );
  }
}
