import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = "Informe seu peso e altura";

  void _resetFields() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      _infoText = "Informe seu peso e altura";
    });
  }

  void calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      var imc = weight / (height * height);
      var imcAsPrecision = imc.toStringAsPrecision(4);
      print(imcAsPrecision);
      if (imc < 18.6) {
        _infoText = "Abaixo do peso: ${imcAsPrecision}";
      } else {
        _infoText = "${imcAsPrecision}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: _resetFields,
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      backgroundColor: Colors.lime,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.person,
              size: 120,
              color: Colors.white,
            ),
            TextField(
              keyboardType: TextInputType.number,
              cursorColor: Colors.white,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 25),
              controller: weightController,
              decoration: const InputDecoration(
                  labelText: "Peso (Kg)",
                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700)),
            ),
            TextField(
              keyboardType: TextInputType.number,
              cursorColor: Colors.white,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 25),
              controller: heightController,
              decoration: const InputDecoration(
                  labelText: "Altura (cm)",
                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: calculate,
                  style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
                  child: const Text(
                    "Calcular",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              _infoText,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
