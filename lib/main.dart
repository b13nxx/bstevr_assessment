import 'package:flutter/material.dart';

/*
 * These are the internal dependencies for the widget below
 */
import 'package:bstevr_assessment/screens/speed_prototyping.dart';
import 'package:bstevr_assessment/screens/coin_detector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BSTEVR Assessment',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => SpeedPrototyping(),
        '/coinDetector': (BuildContext context) => const CoinDetector(),
      }
    );
  }
}


