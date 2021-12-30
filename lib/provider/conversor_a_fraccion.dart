// classe que por medio de su instancia, convierte
// un número con punto decimal ingresado en el
// constructor y lo regresa en fracción: el
// denominador a través de su método getDenominador
// y el numerador a través de su método getNumerador

class ConversorAFraccion {
  // parámetros de la classe
  double num = 0;
  String numStr = '';
  bool esPunto = false;
  int contadorDecimales = -1;
  int denominador = 1;
  int numerador = 1;
  int nuevoNumerador = 0;
  int nuevoDenominador = 0;

  // constructor: inicializa la variable num a partir de double
  // recibido, después lo convierte a str y después manda llamar a
  // los métodos que crean el denominador, numerador y el método
  // que realiza la simplificación del numerador y denominador
  ConversorAFraccion(double mm) {
    num = mm;
    numStr = num.toString();

    _creaDenominador();
    _creaNumerador();
    _simplificacion();
  }

  _creaDenominador() {
    // determina la cantidad de decimales después del punto
    for (int i = 0; i < numStr.length; i++) {
      if (numStr[i] == '.') esPunto = true;
      if (esPunto) contadorDecimales++;
    }

    //print("decimales: $contadorDecimales");

    // crea el denominador
    for (int i = 0; i < contadorDecimales; i++) {
      denominador *= 10;
    }
    print("denominador: $denominador");
  }

  _creaNumerador() {
    numerador = (num * denominador).toInt();
    print("numerador: $numerador");
  }

  // método que simplifica la fracción
  _simplificacion() {
    for (int i = 2; i < 20; i++) {
      for (int j = 2; j < 20; j++) {
        if (numerador % j == 0 && denominador % j == 0) {
          nuevoNumerador = numerador ~/ j;
          nuevoDenominador = denominador ~/ j;
        }
      }
      if (nuevoNumerador != 0 && nuevoDenominador != 0) {
        numerador = nuevoNumerador;
        denominador = nuevoDenominador;
      } else {
        nuevoNumerador = numerador;
        nuevoDenominador = denominador;
      }
    }
  }

  int getNumerador() {
    print("nuevoNum: $nuevoNumerador");

    return nuevoNumerador;
  }

  int getDenominador() {
    print("nuevoDen: $nuevoDenominador");

    return nuevoDenominador;
  }
}
