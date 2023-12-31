// ignore_for_file: sized_box_for_whitespace

import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';


class PhotoViewScreen extends StatefulWidget {
  final String image;
  const PhotoViewScreen({super.key, required this.image});

  @override
  State<PhotoViewScreen> createState() => _PhotoViewScreenState();
}

class _PhotoViewScreenState extends State<PhotoViewScreen> {
  bool rotation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                rotation = true;
              });
            }, icon: const Text(
            "Rotate",
            style: TextStyle(
              color: Colors.white
            ),

          ),)
        ],
      ),
      body: RotatedBox(
        quarterTurns: !rotation ? -3 : 0,
        child: Container(
          height: MediaQuery.of(context).size.height,
            child: PhotoView(
              imageProvider: CachedNetworkImageProvider(baseImage+widget.image),
              filterQuality: FilterQuality.high,

            )
        ),
      ),
    );
  }
}
