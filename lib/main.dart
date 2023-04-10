import 'dart:math';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Number Shapes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool ePatrat(int numar)
  {
    final double squareRoot = sqrt(numar);
    return squareRoot.toInt() == squareRoot;
  }

  bool eCub(int numar)
  {
    final num cubeRoot = pow(numar, 1 / 3);
    // return cubeRoot.toInt() == cubeRoot;
    
    final int roundedCubeRoot = cubeRoot.round();

    return roundedCubeRoot * roundedCubeRoot * roundedCubeRoot == numar;
  }
  
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
      
            children: <Widget>[
      
              const Text(
                'Please input a number to see if it is square or triangular.',
                style: TextStyle(
                  fontSize: 20,
                )
              ),
      
              TextField(
                controller: _textController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
      
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final int inputNumber = int.parse(_textController.text);
          String message = '';

          if (ePatrat(inputNumber) && eCub(inputNumber)) {
            message = 'Number $inputNumber is both SQUARE and TRIANGULAR.';
          } else if (ePatrat(inputNumber) && !eCub(inputNumber)) {
            message = 'Number $inputNumber is SQUARE.';
          } else if (!ePatrat(inputNumber) && eCub(inputNumber)) {
            message = 'Number $inputNumber is TRIANGULAR.';
          } else if (!ePatrat(inputNumber) && !eCub(inputNumber)) {
            message = 'Number $inputNumber is neither SQUARE or TRIANGULAR.';
          }

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(inputNumber.toString()),
                content: Text(message),
              );
            },
          );
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
