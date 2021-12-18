import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.cyan[200],
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Center(
              child: Text('My Calculator'),
            ),
          ),
          body: MainBody()),
    );
  }
}

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  String btnval = '';
  String result = '';
  int firstVal = 0;
  int secondVal = 0;
  String textToDisplay = '0';
  String operatorPerform = '';

  void pressedButton(String btnval) {
    if (btnval == 'C') {
      textToDisplay = '';
      firstVal = 0;
      secondVal = 0;
      result = '0';
    } else if (btnval == '+' ||
        btnval == '-' ||
        btnval == 'X' ||
        btnval == '/') {
      firstVal = int.parse(textToDisplay);
      result = '';
      operatorPerform = btnval;
    } else if (btnval == '=') {
      secondVal = int.parse(textToDisplay);

      // for operations performn in by using condition inside condition----
      if (operatorPerform == '+') {
        result = (firstVal + secondVal).toString();
      } else if (operatorPerform == '-') {
        result = (firstVal - secondVal).toString();
      } else if (operatorPerform == 'X') {
        result = (firstVal * secondVal).toString();
      } else if (operatorPerform == '/') {
        result = (firstVal / secondVal).toString();
      }
    } else {
      result = int.parse(textToDisplay + btnval).toString();
    }
    setState(() {
      textToDisplay = result;
    });
  }

  Widget setButton(String btnval) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          pressedButton(btnval);
        },
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            '$btnval',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.lightBlue[300],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  '$textToDisplay',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              setButton('7'),
              setButton('8'),
              setButton('9'),
              setButton('/'),
            ],
          ),
          Row(
            children: [
              setButton('4'),
              setButton('5'),
              setButton('6'),
              setButton('X'),
            ],
          ),
          Row(
            children: [
              setButton('1'),
              setButton('2'),
              setButton('3'),
              setButton('-'),
            ],
          ),
          Row(
            children: [
              setButton('0'),
              setButton('C'),
              setButton('='),
              setButton('+'),
            ],
          ),
        ],
      ),
    );
  }
}
