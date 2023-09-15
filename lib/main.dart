import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController wt = TextEditingController();
  TextEditingController ht = TextEditingController();
  int w=0 ,h=0;
  double res = 0;
  String ans = ' ', inter = ' ';
  bmi(){
    setState(() {
      w = int.parse(wt.text);
      h = int.parse(ht.text);
      res = 10000 * w / (h * h);
      ans = res.toStringAsPrecision(4);
      if (res < 18.5)
      {
        inter = 'Underweight';
      }
      else if (res >= 18.5 && res <= 24.9)
      {
        inter = 'Normal weight';
      }
      else if (res >= 25 && res <= 29.9)
      {
        inter = 'Overweight';
      }
      else
      {
        inter = 'Obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Image(
            image: AssetImage('images/bmi.jpg'),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20.0,20.0,0,0),
            child: const Text(
              'Enter your weight (in kg)',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: TextField(
              controller: wt,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter weight',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
            child: const Text(
                'Enter your height (in cm)',
                style: TextStyle(
                  fontSize: 15,
                ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: ht,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter height',
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
                onPressed: (){
                  bmi();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo[900]),
                child: const Text(
                    'Calculate BMI',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                ),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              width: 300,
              margin: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
              padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
              decoration: const BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
              ),
              child: const Text(
                'Result',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child : Container(
              width: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.indigo, width: 2),
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
                color: Colors.blue[50],
              ),
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'BMI : $ans',
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      'Interpretation : $inter',
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}