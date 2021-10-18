import 'package:qr_reader/widgets/card_table.dart';
import 'package:qr_reader/widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:qr_reader/widgets/background.dart';
import 'package:qr_reader/widgets/custom_bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Background
          Background(),

          _HomeBody(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //Titulos
          PageTitle(),

          // CardTable
          CardTable()
        ],
      ),
    );
  }
}
