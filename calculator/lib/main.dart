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
      title: 'Hesap Makinesi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String sonuc = "0";
  String sonucGecmisi = "";
  double num1 = 0;
  double num2 = 0;
  String islem = "";

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        sonuc = "0";
        sonucGecmisi = "";
        num1 = 0;
        num2 = 0;
        islem = "";
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
        num1 = double.parse(sonuc);
        islem = buttonText;
        sonucGecmisi += sonuc + islem;
        sonuc = "0";
      } else if (buttonText == "=") {
        num2 = double.parse(sonuc);
        if (islem == "+") {
          sonuc = (num1 + num2).toString();
        }
        if (islem == "-") {
          sonuc = (num1 - num2).toString();
        }
        if (islem == "*") {
          sonuc = (num1 * num2).toString();
        }
        if (islem == "/") {
          sonuc = (num1 / num2).toString();
        }
        sonucGecmisi = "";
      } else {
        if (sonuc == "0") {
          sonuc = buttonText;
        } else {
          sonuc += buttonText;
        }
      }
    });
  }

  Widget _buildButton(String buttonText) {
    return Padding(
      padding: const EdgeInsets.all(12.0), // Padding değerini düşürdük
      child: ElevatedButton(
        onPressed: () {
          _buttonPressed(buttonText);
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(5.0), // Butonun içerisindeki boşlukları ayarladık
        ),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 30.0), // Buton yazı boyutunu ayarladık
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hesap Makinesi'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(
              sonucGecmisi,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(
              sonuc,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                _buildButton("7"),
                _buildButton("8"),
                _buildButton("9"),
                _buildButton("/"),
                _buildButton("4"),
                _buildButton("5"),
                _buildButton("6"),
                _buildButton("*"),
                _buildButton("1"),
                _buildButton("2"),
                _buildButton("3"),
                _buildButton("-"),
                _buildButton("0"),
                _buildButton("C"),
                _buildButton("="),
                _buildButton("+"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Created by Said',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
