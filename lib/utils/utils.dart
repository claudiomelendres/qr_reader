import 'package:flutter/cupertino.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {
  final url = scan.valor;

  if (scan.tipo == 'http') {
    // await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  } else {
    // print('geo');
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
