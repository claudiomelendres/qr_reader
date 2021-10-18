import 'package:flutter/material.dart';

class CaratulaPage extends StatelessWidget {
  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.5, 0.5],
        colors: [Color(0xff4ac0df), Color(0xff4ac0df)]),
  );
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // Purple Gradient
      Container(
        decoration: boxDecoration,
      ),
      // Pink box
      _Logo(),
    ]);
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Center(child: Image(image: AssetImage('assets/logo1.png'))),
          Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'screen');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text('Comenzar',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xff0098FA),
                      shape: StadiumBorder())))
        ],
      ),
    );
  }
}
