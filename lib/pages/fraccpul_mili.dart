// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class FraccionDePulgadasAMilimetrosPage extends StatefulWidget {
  @override
  _FraccionDePulgadasAMilimetrosPage createState() =>
      _FraccionDePulgadasAMilimetrosPage();
}

class _FraccionDePulgadasAMilimetrosPage
    extends State<FraccionDePulgadasAMilimetrosPage> {
  // numerador ingreado por el usuarios
  int numerador = 0;
  int denominador = 0;
  bool botonPresionado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fracción de Pulgadas a milimetros'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
        children: [
          myRow(),
          // espaciado entre el Row y el elevatedButton
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70.0),
            child: myElevatedButton(),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text(
              '${numerador.toString()} / ${denominador.toString()} in',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0),
            ),
            subtitle: Text('de pulgadas'),
          ),
          Center(
            child: Text(
              'equivalen a',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text(
              '${_deFraccionDePulgadasAMilimetros(numerador, denominador)} mm',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0),
            ),
            subtitle: Text('milímetros'),
          ),
        ],
      ),
    );
  }

  /*
    para minimizar el tamaño del código del ListView, 
    se extrajo la fila 
  */
  Row myRow() {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /* 
            si no se pone el expanded, ocurre un error y los 
            textfield no se visualizan
            */
        Expanded(child: myTextFieldNumerador()),
        SizedBox(
          width: 10,
        ),
        Container(
          margin: EdgeInsets.only(bottom: 17.0),
          child: Text(
            "/",
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(child: myTextFieldDenominador()),
      ],
    );
  }

  // metodo que crea el ElevatedButton
  ElevatedButton myElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        botonPresionado = true;
        setState(() {});
        //TODO: agregar el método _deFraccionDePulgadasAMilimetros
      },
      child: Text('Calcular'),
    );
  }

  // captura el numerador
  TextField myTextFieldNumerador() {
    return TextField(
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 28.0,
      ),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: '0',
        helperText: 'Ingresa el numerador',
        helperMaxLines: 2,
      ),
      onChanged: (valor) {
        numerador = int.parse(valor);
        //print(milimetros);
      },
    );
  }

  // captura el denominador
  TextField myTextFieldDenominador() {
    return TextField(
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 28.0,
      ),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: '0',
        helperText: 'Ingresa el denominador',
        helperMaxLines: 2,
      ),
      onChanged: (valor) {
        denominador = int.parse(valor);
        //print(milimetros);
      },
    );
  }

  /*
    _deFraccionDePulgadasAMilimetros recibe el numerdador 
    y el denominador y luego regresa la conversión. 
  */
  // x = numerador y = denominador
  String _deFraccionDePulgadasAMilimetros(int x, int y) {
    double division;
    String pulgadas;

    if (botonPresionado) {
      division = x / y;

      pulgadas = (division * 25.4).toStringAsPrecision(5);
      print(pulgadas);
      return pulgadas;
    } else {
      return "0.0";
    }
  }
}
