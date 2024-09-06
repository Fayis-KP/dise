import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Dise extends StatefulWidget {
  const Dise({super.key});

  @override
  State<Dise> createState() => _DiseState();
}

class _DiseState extends State<Dise> {
  int a = 3;
  int b = 5;

  void change() {
    var pic = Random();
    setState(() {
      a = pic.nextInt(6) + 1;

      b = pic.nextInt(6) + 1;
      if (a==b){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Alert'),
              content: Text('You got the same number on both dice!'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ],
            );
          },
        );
      }
    }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        actions: [Icon(Icons.more_vert)],
        backgroundColor: Colors.green,
        title: Text(
          "Dise",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "I'm Feeling Lucky",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: lerpDouble(20, 20, 10)),
          ),
          SizedBox(
            height: 60,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                  image: DecorationImage(image: AssetImage("assets/$a.jpg"))),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage("assets/$b.jpg"), fit: BoxFit.cover)),
            ),
          ]),
          SizedBox(
            height: 50,
          ),
          TextButton(
              onPressed: () {
                change();
              },
              child: Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
                child: Center(
                  child: Text(
                    "Start",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
