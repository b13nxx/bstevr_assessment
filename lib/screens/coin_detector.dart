import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

/*
 * These are the internal dependencies
 */
import 'package:bstevr_assessment/commons/box_decorations.dart';
import 'package:bstevr_assessment/widgets/loading_bar.dart';
import 'package:bstevr_assessment/widgets/coin_card.dart';
import 'package:bstevr_assessment/utilities/custom_audio_player.dart';
import 'package:bstevr_assessment/widgets/custom_app_bar.dart';

class CoinDetector extends StatefulWidget {
  const CoinDetector({Key? key}) : super(key: key);

  /*
   * By including this line, it converts our component to stateful one
   * that means our component has some sort of data
   * which will change during lifetime of the component
   */
  @override
  _CoinDetectorState createState() => _CoinDetectorState();
}

class _CoinDetectorState extends State<CoinDetector> {
  /*
   * These are class-specific private fields
   */
  late StreamBuilder _streamBuilder;

  /*
   * These are class-specific private methods
   */
  StreamBuilder _getStreamBuilder() {
    return StreamBuilder(
        stream: _tick(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) =>
            SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _entries.isEmpty ? [const LoadingBar()] : _entries,
            )));
  }

  /*
   * This is the Stream itself returning randomly 'Real Coin' or 'Fake Coin'
   * also populating Coin Card list based on generated random data
   */
  Stream<String> _tick() async* {
    while (!_isPaused) {
      // To be able to return data every 3 seconds
      await Future<void>.delayed(const Duration(seconds: 3));

      int random = Random().nextInt(2);
      bool isReal = random != 0;
      String headerText = isReal ? 'Real Coin' : 'Fake Coin';

      if (!_isPaused) {
        _setAppTitle(isReal ? 'Real' : 'Fake');
        _addCoinEntry(headerText, isReal);

        if (isReal) {
          CustomAudioPlayer.instance.playCoinSound();
        }
      }

      yield headerText;
    }
  }

  /*
   * These are initializing and disposing logics
   */
  @override
  void initState() {
    super.initState();

    _streamBuilder = _getStreamBuilder();
  }

  @override
  void dispose() {
    _isPaused = true; // Stopping the Stream itself.
    /*
     * We don't need to do below because The StreamBuilder itself extends from
     * StreamBuilderBase which is a StatefulWidget, and it handles
     * the StreamSubscription with its own dispose method
     */
    // _streamBuilder.dispose();

    super.dispose();
  }

  /*
   * The state, basically data that changes over time
   */
  String _appTitle = 'Waiting For Tick';
  bool _isPaused = false;
  final List<CoinCard> _entries = [];

  /*
   * These are inner logics that will change the state of the component
   */
  void _setAppTitle(String appTitle) {
    setState(() {
      _appTitle = appTitle;
    });
  }

  void _setIsPaused(bool value) {
    setState(() {
      _isPaused = value;

      // To be able to resume, we need to re-initialize StreamBuilder manually
      if (!_isPaused) {
        _streamBuilder = _getStreamBuilder();
      }
    });
  }

  void _addCoinEntry(String headerText, bool isReal) {
    setState(() {
      _entries.insert(
          0,
          CoinCard(
            key: UniqueKey(),
            headerText: headerText,
            isReal: isReal
          ));
    });
  }

  /*
   * The rendering method, in which the component tells
   * how it should show itself
   */
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecorations.gradient(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(
            includeToggle: true,
            appTitle: _appTitle,
            isToggleOn: !_isPaused,
            isToggleDisabled: _entries.isEmpty,
            onToggleChanged: (bool value) => _setIsPaused(!value),
          ),
          body: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            child: _streamBuilder,
          ),
        ));
  }
}
