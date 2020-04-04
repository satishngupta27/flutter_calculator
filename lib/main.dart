import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String equation = "0";
  String reslut = "0";
  String expression = "";


  void btnClick(String btnText) {
    setState(() {
      if (btnText == "C") {
        equation = "0";
        reslut = "0";
      }
      else if (btnText == "del") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      }
      else if (btnText == "=") {
        expression = equation;
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          reslut = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          reslut = "Error";
        }
      } else {
        if (equation == "0") {
          equation = btnText;
        } else {
          equation = equation + btnText;
        }
      }
    });
  }





  Widget customButton(String btval) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25),
        child: Text(
          btval,
          style: TextStyle(fontSize: 25.0),
        ),
        onPressed: () => btnClick(btval),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$equation",
                  style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$reslut",
                  style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                customButton("C"),
                customButton("^"),
                customButton("del"),
                customButton("√"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("7"),
                customButton("8"),
                customButton("9"),
                customButton("*"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("4"),
                customButton("5"),
                customButton("6"),
                customButton("/"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("1"),
                customButton("2"),
                customButton("3"),
                customButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("0"),
                customButton("."),
                customButton("="),
                customButton("+"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
