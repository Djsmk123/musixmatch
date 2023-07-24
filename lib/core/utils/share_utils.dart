import 'package:share_plus/share_plus.dart';

class ShareUtils {
  static shareLink(String url, String message) async {
    await Share.share(
      url,
      subject: message,
    );
  }
}
