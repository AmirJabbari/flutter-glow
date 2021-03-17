import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

const flutterColor = Color(0xFF40D0FD);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool checkboxSelected = false;
  bool switchSelected = false;
  bool radioSelected = false;
  bool iconSelected = false;

  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GlowButton(
              onPressed: () {},
              color: flutterColor,
              child: Text('Glow'),
            ),
            SizedBox(height: 32),
            GlowCheckbox(
              value: checkboxSelected,
              enable: true,
              color: flutterColor,
              onChange: (bool value) {
                setState(() {
                  checkboxSelected = !checkboxSelected;
                });
              },
            ),
            SizedBox(height: 32),
            GestureDetector(
              onTap: () {
                setState(() {
                  iconSelected = !iconSelected;
                });
              },
              child: GlowIcon(
                iconSelected ? Icons.wb_cloudy : Icons.cloud_queue,
                color: flutterColor,
                glowColor: iconSelected ? flutterColor : Colors.transparent,
                size: 64,
                blurRadius: 9,
              ),
            ),
            SizedBox(height: 32),
            GlowText(
              'Glow Text',
              style: TextStyle(fontSize: 40, color: flutterColor),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GlowRadio<bool>(
                  value: true,
                  groupValue: radioSelected,
                  color: flutterColor,
                  onChange: (value) {
                    setState(() {
                      radioSelected = value;
                      log(value.toString());
                    });
                  },
                ),
                SizedBox(width: 32),
                GlowRadio<bool>(
                  value: false,
                  color: flutterColor,
                  groupValue: radioSelected,
                  onChange: (value) {
                    setState(() {
                      radioSelected = value;
                      log(value.toString());
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 32),
            GlowSwitch(
              onChanged: (value) {
                setState(() {
                  switchSelected = value;
                });
              },
              value: switchSelected,
              activeColor: flutterColor.withOpacity(0.6),
              blurRadius: 4,
            ),
            SizedBox(height: 32),
            GlowLineProgress(
              blurRadius: 12,
              glowColor: flutterColor,
            )
          ],
        ),
      ),
    );
  }
}
