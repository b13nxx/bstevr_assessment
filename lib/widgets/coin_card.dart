import 'package:flutter/material.dart';
import 'dart:async';

/*
 * These are the internal dependencies
 */
import 'package:bstevr_assessment/commons/text_styles.dart';
import 'package:bstevr_assessment/utilities/helper_methods.dart';
import 'package:bstevr_assessment/utilities/custom_audio_player.dart';

class CoinCard extends StatefulWidget {
  /*
   * The props, meaning these are not gonna change
   * during lifetime of the component
   */
  final String headerText;
  final bool isReal;
  final DateTime creationDate;

  CoinCard(
      {Key? key,
      required this.headerText,
      required this.isReal})
      : creationDate = DateTime.now(),
        super(key: key);

  /*
   * By including this line, it converts our component to stateful one
   * that means our component has some sort of data
   * which will change during lifetime of the component
   */
  @override
  _CoinCardState createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> with TickerProviderStateMixin {
  /*
   * These are class-specific private fields
   */
  late Timer _timer;
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  /*
   * These are initializing and disposing logics
   */
  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1),
        (Timer t) => _setBodyText("${getTimePassed(widget.creationDate)} ago"));
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
    _animation = Tween<Offset>(
      begin: const Offset(1.1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));
  }

  @override
  void dispose() {
    _timer.cancel();
    _animationController.dispose();

    super.dispose();
  }

  /*
   * The state, basically data that changes over time
   */
  bool _isExpanded = false;
  String _bodyText = '0s ago';

  /*
   * These are inner logics that will change the state of the component
   */
  void _toggleExpandable() {
    setState(() {
      _isExpanded = !_isExpanded;
    });

    if (widget.isReal) {
      CustomAudioPlayer.instance.playCoinSound();
    }
  }

  void _setBodyText(String text) {
    setState(() {
      _bodyText = text;
    });
  }

  /*
   * The rendering method, in which the component tells
   * how it should show itself
   */
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: _animation,
        child: Container(
            margin: const EdgeInsets.all(5),
            child: ExpansionPanelList(
              animationDuration: const Duration(milliseconds: 1000),
              dividerColor: Colors.red,
              elevation: 1,
              children: [
                ExpansionPanel(
                  body: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(_bodyText)),
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        widget.headerText,
                        style: TextStyles.normal(),
                      ),
                    );
                  },
                  isExpanded: _isExpanded,
                ),
              ],
              expansionCallback: (int index, bool status) =>
                  _toggleExpandable(),
            )));
  }
}
