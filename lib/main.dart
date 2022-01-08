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

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seu peso e altura";

  void _resetFields() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      _infoText = "Informe seu peso e altura";
      _formKey = GlobalKey<FormState>();
    });
  }

  void calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      var imc = weight / (height * height);
      var imcAsPrecision = imc.toStringAsPrecision(4);
      print(imcAsPrecision);
      if (imc < 17) {
        _infoText = "Muito abaixo do peso: ${imcAsPrecision}";
      } else if (imc < 18.5) {
        _infoText = "Abaixo do peso: ${imcAsPrecision}";
      } else if (imc < 25) {
        _infoText = "Peso normal: ${imcAsPrecision}";
      } else if (imc < 30) {
        _infoText = "Acima do peso: ${imcAsPrecision}";
      } else if (imc < 35) {
        _infoText = "Obesidade Grau I: ${imcAsPrecision}";
      } else if (imc < 40) {
        _infoText = "Obesidade Grau II: ${imcAsPrecision}";
      } else {
        _infoText = "Obesidade Grau III: ${imcAsPrecision}";
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.person,
                size: 120,
                color: Colors.white,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.white,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 25),
                controller: weightController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira o seu peso";
                  }
                },
                decoration: const InputDecoration(
                    labelText: "Peso (Kg)",
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700)),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.white,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 25),
                controller: heightController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira a sua altura";
                  }
                },
                decoration: const InputDecoration(
                    labelText: "Altura (cm)",
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700)),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        calculate();
                      }
                    },
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
      ),
    );
  }
}
