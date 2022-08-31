import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _heightController = TextEditingController();

  TextEditingController _weightController = TextEditingController();

  double _bmiResult = 0;

  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "BMI Calculate",
          style: TextStyle(
              color: Colors.yellow,
              fontSize: 15.0,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(136, 0, 0, 0),
      ),
      body: Column(children: [
        const SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.black,
                height: 40.0,
                width: 110.0,
                child: TextField(
                  controller: _heightController,
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Height',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                color: Colors.black,
                height: 40.0,
                width: 110.0,
                child: TextField(
                  controller: _weightController,
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Weight',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.black),
            onPressed: () {
              double height = double.parse(_heightController.text);
              double weight = double.parse(_weightController.text);
              setState(() {
                _bmiResult = weight / (height * height);
                if (_bmiResult > 25) {
                  _textResult = "You are over Weight !";
                } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                  _textResult = "You Are Normal Weight!";
                } else {
                  _textResult = "You Are Under Weight !";
                }
              });
            }, // amal bad az click calculate
            child: const Text(
              'Calculate',
              style: TextStyle(color: Colors.yellow, fontSize: 25.0),
            )),
        const SizedBox(
          height: 100.0,
        ),
        Text(_bmiResult.toString(),
            style: TextStyle(color: Colors.yellow, fontSize: 30.0)),
        const SizedBox(
          height: 100.0,
        ),
        Visibility(
          visible: _textResult.isNotEmpty,
          child: Text(
            _textResult,
            style: const TextStyle(color: Colors.yellow, fontSize: 23.0),
          ),
        ),
        const Rightbar(BarWidth: 20.0),
        const Rightbar(BarWidth: 60.0),
        const Rightbar(BarWidth: 20.0),
        const LeftBar(BarWidth: 30.0),
        const LeftBar(BarWidth: 30.0),
      ]),
    );
  }
}

class Rightbar extends StatelessWidget {
  final double BarWidth;
  const Rightbar({Key? key, required this.BarWidth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 26.0,
            width: BarWidth,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0)),
              color: Colors.yellow,
            ),
          )
        ],
      ),
    );
  }
}

class LeftBar extends StatelessWidget {
  final double BarWidth;
  const LeftBar({Key? key, required this.BarWidth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 26.0,
            width: BarWidth,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)),
              color: Colors.yellow,
            ),
          )
        ],
      ),
    );
  }
}
