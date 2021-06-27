import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

String num1 = '';
String num2 = '';
String operador = '';
String resultado = '';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Oficina',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: 'Calculadora - Oficina'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _selecionaNum1(String num) {
    setState(() {
      num1 += num;
    });
  }

  void _selecionaNum2(String num) {
    setState(() {
      num2 += num;
    });
  }

  void _selecionaOperador(String caractere) {
    setState(() {
      operador = caractere;
    });
  }

  void _calcula() {
    setState(() {
      double n1, n2, result = 0;
      n1 = double.parse(num1);
      n2 = double.parse(num2);
      switch (operador) {
        case '+':
          result = n1 + n2;
          break;
        case '-':
          result = n1 - n2;
          break;
        case '*':
          result = n1 * n2;
          break;
        case '/':
          result = n1 / n2;
          break;
        case '%':
          result = (n1 / 100) * n2;
          break;
      }
      resultado = result.toString();
    });
  }

  void _limpar() {
    setState(() {
      num1 = '';
      num2 = '';
      operador = '';
      resultado = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaNum1('0'),
                  child: Text('0'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaNum1('1'),
                  child: Text('1'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaNum1('2'),
                  child: Text('2'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaNum1('3'),
                  child: Text('3'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaNum1('4'),
                  child: Text('4'),
                ),
              ),
            ]),
            Row(children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaNum1('5'),
                  child: Text('5'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaNum1('6'),
                  child: Text('6'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaNum1('7'),
                  child: Text('7'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaNum1('8'),
                  child: Text('8'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaNum1('9'),
                  child: Text('9'),
                ),
              ),
            ]),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Row(children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaOperador('+'),
                  child: Text('+'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaOperador('-'),
                  child: Text('-'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaOperador('*'),
                  child: Text('*'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaOperador('/'),
                  child: Text('/'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaOperador('%'),
                  child: Text('%'),
                ),
              ),
            ]),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Row(children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaNum2('0'),
                  child: Text('0'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaNum2('1'),
                  child: Text('1'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaNum2('2'),
                  child: Text('2'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaNum2('3'),
                  child: Text('3'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaNum2('4'),
                  child: Text('4'),
                ),
              ),
            ]),
            Row(children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaNum2('5'),
                  child: Text('5'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaNum2('6'),
                  child: Text('6'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaNum2('7'),
                  child: Text('7'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaNum2('8'),
                  child: Text('8'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () => _selecionaNum2('9'),
                  child: Text('9'),
                ),
              ),
            ]),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Row(children: <Widget>[
              MaterialButton(
                onPressed: () => _calcula(),
                child: Text('Calcular'),
              ),
              MaterialButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () => _limpar(),
                child: Text('Zerar'),
              ),
            ]),
            SizedBox(
              width: 20,
              height: 100,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Operação: ',
                ),
                Text(
                  '$num1 $operador $num2',
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  'Resultado: ',
                ),
                Text(
                  '$resultado',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
