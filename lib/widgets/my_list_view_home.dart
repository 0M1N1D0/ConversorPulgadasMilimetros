// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors

// archivos de flutter
import 'package:flutter/material.dart';

// archivos propios
import 'package:conversor/pages/pages.dart'; // paginas

// widget ListView
class MyListViewHome extends StatelessWidget {
  // lista de títulos para las listtile
  final List<String> titulos = [
    'Milímetros a pulgadas',
    'Milimetros a fracción de pulgadas',
    'Pulgadas a milímietros',
    'Fracción de pulgadas a milímetros',
    'Fracción de pulgadas a pulgadas',
    'Pulgadas a fracción de pulgadas',
  ];

  final List<String> subtitulos = [
    'mm  ->  in',
    'mm  ->  a/b in',
    'in  ->  mm',
    'a/b in  ->  mm',
    'a/b in  ->  in',
    'in  ->  a/b in',
  ];

// lista de paginas para las listtiles
  final List<Widget> paginas = [
    MilimetrosAPulgadasPage(),
    MilimetrosAFraccionDePulgadasPage(),
    PulgadasAMilimetrosPage(),
    FraccionDePulgadasAMilimetrosPage(),
    FraccionDePulgadasAPulgadasPage(),
    PulgadasAFraccionDePulgadasPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // manda a llamar el método _myListTile y se le pasa
        // el contexto y el indice que cargará los títulos y
        // las páginas
        _myListTile(context, 0),
        Divider(),
        _myListTile(context, 1),
        Divider(),
        _myListTile(context, 2),
        Divider(),
        _myListTile(context, 3),
        Divider(),
        _myListTile(context, 4),
        Divider(),
        _myListTile(context, 5),
        Divider(),
      ],
    );
  }

  // método que genera el listtile y redirecciona a la
// página que se le pasó por argumento
  Widget _myListTile(BuildContext context, int index) {
    int indice = index;
    return ListTile(
      trailing: Icon(Icons.arrow_forward_outlined),
      title: Text(titulos[indice]),
      subtitle: Text(subtitulos[indice]),
      onTap: () {
        // cuando haga touch en este listtile
        // me llevará a la página mili_pul.dart
        final route = MaterialPageRoute(builder: (context) {
          return paginas[indice];
        });
        Navigator.push(context, route);
      },
    );
  }
}
