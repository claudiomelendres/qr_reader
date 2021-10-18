import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text('Puntos QR',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Encuentra los 6 puntos que se encuentran en diferentes ubicaciones de la FEICOBOL ',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ],
          )),
    );
  }
}
