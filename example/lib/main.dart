import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

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
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool checkboxSelected = false;

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
              child: Text('test'),
              onPressed: () {},
            ),
            SizedBox(height: 16),
            GlowCheckbox(
              value: checkboxSelected,
              enable: true,
              onChange: (bool value) {
                setState(() {
                  checkboxSelected = !checkboxSelected;
                });
              },
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
