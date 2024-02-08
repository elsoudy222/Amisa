import 'package:amisa/screens_path.dart';


class ShowRoomVideoScreen extends StatefulWidget {
  final int showRoomId;

  const ShowRoomVideoScreen({super.key, required this.showRoomId});

  @override
  State<ShowRoomVideoScreen> createState() => _ShowRoomVideoScreenState();
}

class _ShowRoomVideoScreenState extends State<ShowRoomVideoScreen> {
  late VideoPlayerController _controller;
  late CustomVideoPlayerController customVideoPlayerController;

  String lessonDuration = '0';
  String lessonPosition = '';
  bool isVideoCompleted = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        "$baseImage${LayoutCubit.get(context).showRoomsModel!.rooms[widget.showRoomId].video}"))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        debugPrint("Successfully initialized");

        setState(() {});
      });
    customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _controller,
      customVideoPlayerSettings: const CustomVideoPlayerSettings(
        exitFullscreenOnEnd: true,
        // enterFullscreenOnStart: true,
      ),
    );
    _controller.play();

    isLoading = false;
    _controller.addListener(() {
      if (_controller.value.isPlaying &&
          _controller.value.isInitialized &&
          (_controller.value.duration == _controller.value.position)) {
        debugPrint('Done');
        isVideoCompleted = true;
        debugPrint(_controller.value.duration.toString());
      } else {
        // print('NotYet');
        // print(videoPlayerController.value.duration.toString());
      }
      lessonDuration = _controller.value.duration.toString();
      lessonPosition = _controller.value.position.toString();
      // print(lessonPosition);
      // print(lessonDuration);
      // print(isLessonCompleted);
      // print(videoPlayerController.value.duration);
      // print(videoPlayerController.value.position);
      // print(videoPlayerController.value.isCompleted);
    });
  }

  @override
  void dispose() {
    customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          cubit.showRoomsModel!.rooms[widget.showRoomId].title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: cubit.showRoomsModel!.rooms[widget.showRoomId].video.isNotEmpty
          ? RotatedBox(
              quarterTurns: -3,
              child: Stack(
                children: [
                  SizedBox(
                      height: 500.h,
                      width: MediaQuery.of(context).size.height * 0.8,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.grey,
                        ),
                      )),
                  SizedBox(
                    height: 500.h,
                    width: MediaQuery.of(context).size.height * 0.8,
                    child: CustomVideoPlayer(
                      customVideoPlayerController: customVideoPlayerController,
                    ),
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}
