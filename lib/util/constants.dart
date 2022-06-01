import 'package:line_icons/line_icons.dart';
import 'package:mefood/util/logger.dart';
import 'package:url_launcher/url_launcher.dart';

const kFontFamily = 'Nunito';

final pendingList = [
  {
    'leading': LineIcons.user,
    'title': 'User Profile',
  },
  {
    'leading': LineIcons.addressBook,
    'title': 'User Address',
  },
  {
    'leading': LineIcons.car,
    'title': 'Car Information',
  },
  {
    'leading': LineIcons.lock,
    'title': 'Securit Account',
  },
];

void urlEmailLaunch(
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

void urlPhoneCallLaunch(String phone) {
  launch("tel://$phone");
}

void urlWebsiteLaunch(String url) {
  final Uri websiteUri = Uri(
    scheme: 'https',
    path: url,
  );

  logger.d(websiteUri);

  launchUrl(websiteUri);
}

void urlGoogleMapLaunch(String lat, String lon) async {
  String googleUrl =
      'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
  if (await canLaunch(googleUrl)) {
    await launch(googleUrl);
  } else {
    throw 'Could not open the map.';
  }
}
