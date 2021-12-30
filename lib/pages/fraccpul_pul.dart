// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class FraccionDePulgadasAPulgadasPage extends StatefulWidget {
  @override
  _FraccionDePulgadasAPulgadasPage createState() =>
      _FraccionDePulgadasAPulgadasPage();
}

class _FraccionDePulgadasAPulgadasPage
    extends State<FraccionDePulgadasAPulgadasPage> {
  // numerador ingreado por el usuarios
  int numerador = 0;
  int denominador = 0;
  bool botonPresionado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fracción de Pulgadas a pulgadas'),
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
              '${_deFraccionDePulgadasAPulgadas(numerador, denominador)} in',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0),
            ),
            subtitle: Text('pulgadas'),
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

  String _deFraccionDePulgadasAPulgadas(int x, int y) {
    //double division;
    String pulgadas;
    String resultado;

    if (botonPresionado) {
      //division = x / y;

      pulgadas = (x / y).toString();
      resultado = _cuentaCeros(pulgadas);
      print(resultado);
      return resultado;
    } else {
      return "0.0";
    }
  }

  String _cuentaCeros(String numStr) {
    //bool hayCero = false;
    bool esPunto = false;
    int contadorCeros = 0;
    int contadorDecimales = -1;
    double resultado;
    //List<String> lista = numStr.split("");
    //print(lista[4]);

    for (int i = 0; i < numStr.length; i++) {
      //if (numStr[i] == '0') hayCero = true;
      //print(hayCero);
      if (numStr[i] == ".") esPunto = true;
      //print(esPunto);
      if (esPunto) {
        contadorDecimales++;
        if (numStr[i] == "0") {
          contadorCeros++;
        }
      }
      //print(numStr.length);
    }

    //print(contadorCeros);

    resultado = double.parse(numStr);
    //print('_cuentaCeros : contadorCeros = $contadorCeros');
    if (contadorCeros >= 3) {
      return resultado.toStringAsFixed(2);
    } else if (contadorDecimales < 3) {
      return resultado.toStringAsFixed(2);
    } else {
      return resultado.toStringAsFixed(6);
    }
  }
}
