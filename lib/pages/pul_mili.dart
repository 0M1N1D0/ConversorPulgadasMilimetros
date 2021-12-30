// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class PulgadasAMilimetrosPage extends StatefulWidget {
  @override
  _PulgadasAMilimetrosPage createState() => _PulgadasAMilimetrosPage();
}

class _PulgadasAMilimetrosPage extends State<PulgadasAMilimetrosPage> {
  // almacenará la cantidad ingresada de pulgadas
  double pulgadas = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pulgadas a milimetros'),
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
              '${pulgadas.toString()} in',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0),
            ),
            subtitle: Text('pulgadas'),
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
              '${_dePulgadasAMilimetros()} mm',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0),
            ),
            subtitle: Text('milímetros'),
          ),
        ],
      ),
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
            'Ingresa la cantidad de pulgadas que se convertirán a milímetros.',
        helperMaxLines: 2,
      ),
      onChanged: (valor) {
        pulgadas = double.parse(valor);
        //print(milimetros);
      },
    );
  }

  // metodo que crea el ElevatedButton
  ElevatedButton myElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {});
        //print(_deMilimetrosAPulgadas());
      },
      child: Text('Calcular'),
    );
  }

  // metodo que regresa el cálculo
  String _dePulgadasAMilimetros() {
    String total;
    String totalEditado;
    // toStringAsFixed(6) muestra los primeros 6 decimales
    total = (pulgadas * 25.4).toString();
    print('total: $total');
    totalEditado = _cuentaCeros(total);
    print(totalEditado);
    return totalEditado;
  }

  /* 
    _cuentaCeros: si hay dos ceros consecutivos, 
    regresa un número sólo con dos decimales; 
    si no hay más de dos ceros concecutivos, 
    regresa un número con 6 decimales. 
    ejemplo: en vez de un resultado como: 0.75000042
    regresa 0.75 
  */
  String _cuentaCeros(String numStr) {
    bool hayCero = false;
    bool esPunto = false;
    int contadorCeros = 0;
    double resultado;
    List<String> lista = numStr.split("");
    //print(lista[4]);

    for (int i = 0; i < numStr.length; i++) {
      if (numStr[i] == '0') hayCero = true;
      if (numStr[i] == '.') esPunto = true;
      if (esPunto) {
        if (numStr[i] == '0') {
          contadorCeros++;
          if (i != (numStr.length - 1)) {
            if (lista[i + 1] != '0') {
              contadorCeros = 0;
            }
          }
          if (contadorCeros >= 2) {
            break;
          }
        }
      }
    }

    resultado = double.parse(numStr);
    print('_cuentaCeros : contadorCeros = $contadorCeros');
    if (contadorCeros >= 2 || hayCero == false) {
      return resultado.toStringAsFixed(2);
    } else {
      return resultado.toStringAsFixed(6);
    }
  }
}
