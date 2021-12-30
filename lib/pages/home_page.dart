// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

// archivos de flutter
import 'package:flutter/material.dart';

// archivos propios
import 'package:conversor/widgets/my_list_view_home.dart';
//import 'package:conversor/pages/mili_pul_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        centerTitle: true,
        title: Text('Convertidor milímetros - pulgadas'),
      ),
      // body: se manda llamar al listviewhome
      body: MyListViewHome(),
    );
  }
}
