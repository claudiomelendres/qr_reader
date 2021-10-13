import 'package:flutter/material.dart';

class CaratulaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image(
            image: AssetImage('assets/fondo2.jpg'),
          ),
          IconButton(onPressed: () => {}, icon: Icon(Icons.search_outlined))
        ],
      ),
    );
  }
}
