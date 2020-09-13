import 'package:button_animation_poc/countdown_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Animation Button PoC'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CountdownButton(
              initialText: 'SOS',
              onCompleted: _toggleCompleted,
            ),
          ],
        ),
      ),
    );
  }

  _toggleCompleted() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          height: 300,
          width: double.infinity,
          child: Text('SOS TRIGGERED'),
        );
      },
    );
  }
}
