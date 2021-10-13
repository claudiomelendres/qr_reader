import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancel', true, ScanMode.QR);

        //final barcodeScanRes = 'https://fernando-herrera.com';
        // final barcodeScanRes = 'geo:-17.395075,-66.155077';
        // final barcodeScanRes = 'geo:45.287135,-75.920226';

        if (barcodeScanRes == '-1') return;

        // print(barcodeScanRes);
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
        // scanListProvider.nuevoScan('geo:-17.393777, -66.274144');

        launchURL(context, nuevoScan);
      },
    );
  }
}
