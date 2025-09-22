import 'package:url_launcher/url_launcher.dart';

Future<void> urlLauncher(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Tidak bisa membuka $url');
  }
}
