import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('My Dice(?)'),
          backgroundColor: Colors.black,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(52) + 1;
      rightDiceNumber = Random().nextInt(52) + 1;
      while(rightDiceNumber == leftDiceNumber ) { 
      rightDiceNumber = Random().nextInt(52) + 1;
    }});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              child: Image.asset(
                'images/dice ($leftDiceNumber).png',
              ),
              onPressed: () {
                changeDiceFace();
              },
            ),
          ),
          Expanded(
            child: TextButton(
              child: Image.asset(
                'images/dice ($rightDiceNumber).png',
              ),
              onPressed: () {
                changeDiceFace();
              },
            ),
          ),
        ],
      ),
    );
  }
}
