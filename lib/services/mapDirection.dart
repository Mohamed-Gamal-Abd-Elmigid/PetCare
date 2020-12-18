import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  static Future<void> openMap(String latitude, String longitude) async {
    String googleUrl = 'https://www.google.com/maps/?q=$latitude,$longitude';
    // String googleUrl = 'https://www.google.es/maps/dir/$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
