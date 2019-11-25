import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _text = "Informe seus dados";

  void _resetField() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _text = "Informe seus dados";
    });
  }

  void _calculate() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    double imc = weight / (height * height);

    if (imc < 18.6) {
      setState(() {
        _text = "Abaixo do Peso (${imc.toStringAsFixed(2)})";
      });
    } else if (imc > 18.6) {
      setState(() {
        _text = "Acima do Peso (${imc.toStringAsFixed(2)})";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Calculadora de IMC",
                style: TextStyle(color: Colors.white)),
            centerTitle: true,
            backgroundColor: Colors.black,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    _resetField();
                  })
            ]),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.person_outline, size: 120.0, color: Colors.black),
                Padding(
                  child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Peso (kg)",
                          labelStyle: TextStyle(color: Colors.black)),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                      controller: weightController),
                  padding: EdgeInsets.all(16),
                ),
                Padding(
                  child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Altura (cm)",
                          labelStyle: TextStyle(color: Colors.black)),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                      controller: heightController),
                  padding: EdgeInsets.all(16),
                ),
                Padding(
                  child: Container(
                    height: 50.0,
                    child: RaisedButton(
                        onPressed: () {
                          _calculate();
                        },
                        child: Text("Calcular",
                            style: TextStyle(color: Colors.white)),
                        color: Colors.black),
                  ),
                  padding: EdgeInsets.all(16),
                ),
                Text("$_text",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black))
              ]),
        ));
  }
}
