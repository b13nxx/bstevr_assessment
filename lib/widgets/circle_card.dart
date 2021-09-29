import 'package:flutter/material.dart';

/*
 * These are the internal dependencies
 */
import 'package:bstevr_assessment/commons/text_styles.dart';
import 'package:bstevr_assessment/commons/box_decorations.dart';

class CircleCard extends StatefulWidget {
  /*
   * The props, meaning these are not gonna change
   * during lifetime of the component
   */
  final String text;
  final double iconSize;
  final IconData icon;
  final bool isSelected;

  const CircleCard(
      {Key? key,
      required this.text,
      required this.iconSize,
      required this.icon,
      this.isSelected = false})
      : super(key: key);

  /*
   * By including this line, it converts our component to stateful one
   * that means our component has some sort of data
   * which will change during lifetime of the component
   */
  @override
  _CircleCardState createState() => _CircleCardState();
}

class _CircleCardState extends State<CircleCard> {
  /*
   * This is initializing logic
   */
  @override
  void initState () {
    _selected = widget.isSelected;
    super.initState();
  }

  /*
   * The state, basically data that changes over time
   */
  late bool _selected;

  /*
   * These are inner logics that will change the state of the component
   */
  void _toggleButton() {
    setState(() {
      _selected = !_selected;
    });
  }

  /*
   * The rendering method, in which the component tells
   * how it should show itself
   */
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.iconSize,
        margin: const EdgeInsets.only(right: 25),
        child: Column(children: <Widget>[
          Container(
              width: widget.iconSize,
              height: widget.iconSize,
              margin: const EdgeInsets.only(bottom: 7),
              decoration: BoxDecorations.circle(_selected
                  ? Colors.transparent
                  : Colors.white.withOpacity(0.99)),
              child: IconButton(
                color: _selected ? Colors.white : Colors.orange,
                iconSize: widget.iconSize * 0.625,
                icon: Icon(widget.icon),
                onPressed: _toggleButton,
              )),
          Text(widget.text,
              style: TextStyles.weak(), textAlign: TextAlign.center)
        ]));
  }
}
