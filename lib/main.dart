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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      backgroundColor: Colors.lime,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.person,
            size: 120,
            color: Colors.white,
          ),
          TextField(
            keyboardType: TextInputType.number,
            cursorColor: Colors.white,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 25),
            decoration: InputDecoration(
                labelText: "Peso (Kg)",
                fillColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w700
                )),
          ),
          TextField(
            keyboardType: TextInputType.number,
            cursorColor: Colors.white,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 25),
            decoration: InputDecoration(
                labelText: "Altura (cm)",
                fillColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w700
                )),
          )
        ],
      ),
    );
  }
}
