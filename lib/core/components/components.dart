import '../../view/screens_path.dart';

Widget customCircularProgressIndicator() {
  return const Center(
    child: CircularProgressIndicator.adaptive(
      strokeWidth: 2,
      backgroundColor: Colors.white,
    ),
  );
}