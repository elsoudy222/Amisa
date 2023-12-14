
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

class Functional {

  static Future<void> openMap(String? relGps) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$relGps';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  static void launchWhatsApp({
    required String phone,
    required String message,
  }) async {

    var whatsappUrl = "whatsapp://send?phone=$phone&text=$message";
    await canLaunch(whatsappUrl)
        ? launch(whatsappUrl)
        : print(
        "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
    // return "whatsapp://wa.me/$phone:03452121308:/?text=${Uri.parse(message)}";
  }

  static Future<void> launchSocialMediaAppIfInstalled({
    required String url,
  }) async {
    try {
      bool launched = await launch(url,
          forceSafariVC: false); // Launch the app if installed!

      if (!launched) {
        launch(url); // Launch web view if app is not installed!
      }
    } catch (e) {
      launch(url); // Launch web view if app is not installed!
    }
  }





}

// final Uri urlWhatsapp = Uri.parse("whatsapp://send?phone=+971569570054");
// final Uri url = Uri.parse("tel:+97142399881");
// final Uri urlEmail = Uri.parse("mailto:info@amisakct.com");
//
// Future launchUrl({
//   required String emailUrl, required LaunchMode mode,
//
// }) async {
//   if (!await launchUrl(
//       Uri(
//     scheme: 'mailto',
//     path: 'smith@example.com',
//     queryParameters: {
//       "subject": "Hello",
//     },
//   ),
//       mode: mode)) {
//     throw Exception('Could not launch $emailUrl');
//   }
// }
//
// final Uri emailLaunchUri = Uri(
//   scheme: 'mailto',
//   path: 'smith@example.com',
//   queryParameters: {
//     "subject": "Hello",
//   },
// );
// Future<void> _launchEmailUrl() async {
//   if (!await launchUrl(
//       emailLaunchUri,
//       mode: LaunchMode.externalApplication)) {
//     throw Exception('Could not launch $url');
//   }
