import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:triangles_background/triangles_background.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // showPerformanceOverlay: true,
      title: 'Triangles background Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Triangles background Demo'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        childAspectRatio: 0.6,
        children: [
          Triangles(
            // hDivisions: 20,
            // vDivisions: 20,
            hSpace: 40,
            vSpace: 40,
            v1Color: Colors.red,
            v2Color: Colors.black,
            v3Color: Colors.green,
            v4Color: Colors.yellow,
            lineColor: Colors.black,
            strokeWidth: 0.3,
            circleRadius: 2,
            speedMin: 0.1,
            speedMax: 0.5,
          ),

          Triangles(
            // hDivisions: 20,
            // vDivisions: 20,
            hSpace: 30,
            vSpace: 30,
            v1Color: Colors.white,
            v2Color: Colors.amberAccent,
            v3Color: Colors.cyanAccent,
            v4Color: Colors.black,
            lineColor: Colors.black,
            strokeWidth: 0.5,
            circleRadius: 1,
            speedMin: 0.3,
            speedMax: 1.0,
          ),

          Triangles(
            // hDivisions: 20,
            // vDivisions: 20,
            hSpace: 40,
            vSpace: 40,
            v1Color: Colors.transparent,
            v2Color: Colors.transparent,
            v3Color: Colors.transparent,
            v4Color: Colors.transparent,
            lineColor: Colors.red.withOpacity(0.5),
            strokeWidth: 0.001,
            circleRadius: 30,
            speedMin: 0.1,
            speedMax: 0.5,
          ),

          Triangles(
            // hDivisions: 20,
            // vDivisions: 20,
            hSpace: 40,
            vSpace: 40,
            v1Color: Colors.transparent,
            v2Color: Colors.transparent,
            v3Color: Colors.transparent,
            v4Color: Colors.transparent,
            lineColor: Colors.white,
            strokeWidth: 0.3,
            circleRadius: 0.0,
            speedMin: 0.1,
            speedMax: 1.5,
          ),


        ],
      ),
    );
  }
}
