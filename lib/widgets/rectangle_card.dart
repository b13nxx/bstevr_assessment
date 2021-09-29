import 'package:flutter/material.dart';

/*
 * These are the internal dependencies for the widget below
 */
import 'package:bstevr_assessment/commons/text_styles.dart';
import 'package:bstevr_assessment/commons/box_decorations.dart';

class RectangleCard extends StatefulWidget {
  /*
   * The props, meaning these are not gonna change
   * during lifetime of the component
   */
  final String text;
  final double iconSize;
  final IconData icon;
  final bool isRectangle;
  final String secondText;
  final bool isSelected;

  const RectangleCard(
      {Key? key,
      required this.text,
      required this.iconSize,
      required this.icon,
      required this.isRectangle,
      required this.secondText,
      this.isSelected = false})
      : super(key: key);

  /*
   * By including this line, it converts our component to stateful one
   * that means our component has some sort of data
   * which will change during lifetime of the component
   */
  @override
  _RectangleCardState createState() => _RectangleCardState();
}

class _RectangleCardState extends State<RectangleCard> {
  /*
   * The state, basically data that changes over time
   */
  late bool _selected;

  /*
   * This is initializing logic
   */
  @override
  void initState () {
    _selected = widget.isSelected;
    super.initState();
  }

  /*
   * These are inner logic that will change the state of the component
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
    return GestureDetector(
        onTap: _toggleButton,
        child: Opacity(
            opacity: _selected ? 1 : 0.5,
            child: Container(
                padding: const EdgeInsets.all(10),
                decoration:
                    BoxDecorations.rectangle(Colors.white.withOpacity(0.99)),
                child: Flex(
                    direction:
                        widget.isRectangle ? Axis.horizontal : Axis.vertical,
                    crossAxisAlignment: widget.isRectangle
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Icon(
                            widget.icon,
                            size: widget.iconSize,
                            color: Colors.orange,
                          )),
                      Container(
                          margin:
                              EdgeInsets.only(left: widget.isRectangle ? 0 : 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.text, style: TextStyles.strong()),
                              widget.isRectangle
                                  ? Container()
                                  : Text(widget.secondText,
                                      style: TextStyles.danger())
                            ],
                          )),
                    ]))));
  }
}
