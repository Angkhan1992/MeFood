import 'package:url_launcher/url_launcher.dart';

class LaunchService {
  static void email(
    String email, {
    required String subject,
  }) {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(<String, String>{
        'subject': subject,
      }),
    );

    launchUrl(emailLaunchUri);
  }

  static void dialPhone(String phone) {
    launch("tel://$phone");
  }

  static void website(String url) {
    final Uri websiteUri = Uri(
      scheme: 'https',
      path: url,
    );

    launchUrl(websiteUri);
  }

  static void googleMap(String lat, String lon) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
