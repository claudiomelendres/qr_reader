import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class CardTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          _SingleCard(
            color: Colors.blue,
            icon: Icons.account_balance_outlined,
            text: 'Punto_1',
          ),
          _SingleCard(
            color: Colors.pinkAccent,
            icon: Icons.car_rental,
            text: 'Punto_2',
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            color: Colors.purple,
            icon: Icons.shop,
            text: 'Punto_3',
          ),
          _SingleCard(
            color: Colors.purpleAccent,
            icon: Icons.cloud_queue,
            text: 'Punto_4',
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            color: Colors.deepPurple,
            icon: Icons.movie,
            text: 'Punto_5',
          ),
          _SingleCard(
            color: Colors.lime,
            icon: Icons.food_bank_outlined,
            text: 'Punto_6',
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            color: Colors.blue,
            icon: Icons.accessibility_new,
            text: 'Punto_7',
          ),
          _SingleCard(
            color: Colors.pinkAccent,
            icon: Icons.safety_divider,
            text: 'Punto_8',
          ),
        ]),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard(
      {Key? key, required this.icon, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    print('scans');
    bool valido = true;
    if (scans.length > 0) {
      print(scans.length);
      print(this.text);

      ScanModel scaned = scans.firstWhere(
          (element) => element.valor.contains(this.text.toLowerCase()),
          orElse: () => new ScanModel(valor: '_'));
      // var scaned = scans.first;
      valido = scaned.valor != "_" ? true : false;
      print(scaned.valor);
      print('scanIF');
    }
    var column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: this.color,
          foregroundImage:
              valido == true ? null : AssetImage('assets/logo1.png'),
          child: Icon(this.icon, size: 45, color: Colors.white),
          radius: 40,
        ),
        SizedBox(
          height: 10,
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () async {
            print(this.text);
            // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            //     '#3D8BEF', 'Cancel', true, ScanMode.QR);

            final barcodeScanRes = 'https://www.punto_4.com';
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
          child: Text(this.text,
              style: TextStyle(color: Colors.white, fontSize: 18)),
        )
      ],
    );
    return _CardBackground(child: column);
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;

  const _CardBackground({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: Container(
                // margin: EdgeInsets.all(15),
                height: 180,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(62, 66, 107, 0.7),
                    borderRadius: BorderRadius.circular(20)),
                child: this.child),
          )),
    );
  }
}
