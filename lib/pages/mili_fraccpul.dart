// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
// archivos flutter
import 'package:flutter/material.dart';
// archivos propios
import 'package:conversor/provider/conversor_a_fraccion.dart';

class MilimetrosAFraccionDePulgadasPage extends StatefulWidget {
  @override
  _MilimetrosAFraccionDePulgadasPage createState() =>
      _MilimetrosAFraccionDePulgadasPage();
}

class _MilimetrosAFraccionDePulgadasPage
    extends State<MilimetrosAFraccionDePulgadasPage> {
  // almacenará los mm ingresados por el usuario
  double milimetros = 0;
  double numDecimal = 0;
  int? numerador;
  int? denominador;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mililetros a fracción de pulgadas'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(height: 20),
          myTextField(),
          SizedBox(height: 20),
          // el botón se metió en un padding para poderle cambiar el ancho
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70.0),
            child: myElevatedButton(),
          ),
          Divider(),
          SizedBox(height: 30),
          ListTile(
            title: Text(
              '${milimetros.toString()} mm',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0),
            ),
            subtitle: Text('milimetros'),
          ),
          Center(
            child: Text(
              'equivalen a',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            title: _validaNull(),
            subtitle: Text('pulgadas'),
          ),
        ],
      ),
    );
  }

  // metodo que crea el ElevatedButton
  ElevatedButton myElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        numDecimal = _deMilimetrosAFraccionDePulgadas();
        print(numDecimal);
        ConversorAFraccion num = ConversorAFraccion(numDecimal);
        numerador = num.getNumerador();
        denominador = num.getDenominador();

        setState(() {});
        //print(_deMilimetrosAPulgadas());
      },
      child: Text('Calcular'),
    );
  }

  // metodo que regresa el TextField
  TextField myTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 28.0,
      ),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: '0.000',
        helperText:
            'Ingresa la cantidad de milímetros que se convertirán a pulgadas.',
        helperMaxLines: 2,
      ),
      onChanged: (valor) {
        milimetros = double.parse(valor);
        //print(milimetros);
      },
    );
  }

  // metodo que regresa el calculo
  double _deMilimetrosAFraccionDePulgadas() {
    String aux;
    double totalDecimal;
    // toStringAsFixed(6) muestra los primeros 6 decimales
    aux = (milimetros * 0.0393701).toStringAsFixed(6);
    totalDecimal = double.parse(aux);
    return totalDecimal;
  }

  // si nnumerador y denominador son null, regresa '0'
  Text _validaNull() {
    if (numerador == null && denominador == null) {
      return Text(
        '0 / 0 in',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30.0),
      );
    } else {
      return Text(
        '$numerador / $denominador in',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30.0),
      );
    }
  }
}
