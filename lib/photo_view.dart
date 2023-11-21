// ignore_for_file: sized_box_for_whitespace

import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';


class PhotoViewScreen extends StatelessWidget {
  final String image;
  const PhotoViewScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RotatedBox(
        quarterTurns: -3,
        child: Container(
          height: MediaQuery.of(context).size.height,
            child: PhotoView(
              imageProvider:  CachedNetworkImageProvider(baseImage+image),
              filterQuality:  FilterQuality.high,

            )
        ),
      ),
    );
  }
}
