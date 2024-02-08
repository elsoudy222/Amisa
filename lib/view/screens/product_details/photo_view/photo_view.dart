import 'package:amisa/screens_path.dart';



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
