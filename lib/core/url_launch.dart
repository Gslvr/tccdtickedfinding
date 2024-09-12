import 'package:url_launcher/url_launcher.dart';

class URLLaunch {
  static void urlac({required String urls, required bool mail}) async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri linkweb = Uri.parse(urls);
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: "info@pediatrirutinleri.com",
      query: encodeQueryParameters(
          <String, String>{'subject': 'For PR Mobiles Subject!'}),
    );
    launchUrl(mail ? emailLaunchUri : linkweb);
  }
}
