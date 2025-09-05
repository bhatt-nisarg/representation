import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

abstract class LinkOpener {
  Future<void> openUrl(String urlString);
  Future<void> sendEmail(String email, {String? subject, String? body});
  Future<void> dialPhone(String phone);
}

class UrlLauncherLinkOpener implements LinkOpener {
  @override
  Future<void> openUrl(String urlString) async {
    final Uri uri = Uri.parse(urlString);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $urlString');
    }
  }

  @override
  Future<void> sendEmail(String email, {String? subject, String? body}) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        if (subject != null) 'subject': subject,
        if (body != null) 'body': body,
      },
    );
    if (!await launchUrl(uri)) {
      debugPrint('Could not compose email to $email');
    }
  }

  @override
  Future<void> dialPhone(String phone) async {
    final Uri uri = Uri(scheme: 'tel', path: phone);
    if (!await launchUrl(uri)) {
      debugPrint('Could not dial $phone');
    }
  }
}


