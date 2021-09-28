import 'package:flutter/material.dart';

class CoinDetector extends StatelessWidget {
  const CoinDetector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(2, 175, 192, 1),
          Color.fromRGBO(1, 93, 118, 1),
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(icon: const Icon(Icons.home), onPressed: () {}),
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.add), onPressed: () {})
          ],
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
        ),
        body: Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text('This place will be replaced by Coin Detector')
              ],
            )),
        //bottomNavigationBar:
        //CustomNavigationBar(entries: bottomNavigationBarItems),
      ),
    );
  }
}
