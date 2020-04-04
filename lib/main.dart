import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  int fir_num;
  int second_num;

  Widget customButton(String btval) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25),
        child: Text(
          btval,
          style: TextStyle(fontSize: 25.0),
        ),
        onPressed: () {},
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
                  "output",
                  style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "output",
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
