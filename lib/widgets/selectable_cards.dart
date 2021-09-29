import 'package:flutter/material.dart';

/*
 * These are the internal dependencies for the widget below
 */
import 'package:bstevr_assessment/widgets/rectangle_card.dart';

class SelectableCards extends StatelessWidget {
  /*
   * The props, meaning these are not gonna change
   * during lifetime of the component
   */
  final List<dynamic> entries;
  final bool isRectangle;

  const SelectableCards(
      {Key? key, required this.entries, this.isRectangle = true})
      : super(key: key);

  /*
   * The rendering method, in which the component tells
   * how it should show itself
   */
  @override
  Widget build(BuildContext context) {
    int rowCount = (entries.length / (isRectangle ? 2 : 3)).ceil();

    return Container(
        height: ((isRectangle ? 80 : 160) * rowCount).toDouble(),
        margin: const EdgeInsets.only(left: 5, bottom: 30),
        child: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: isRectangle ? rowCount : 3,
          childAspectRatio: isRectangle ? 1 / 4 : 0.9 / 1,
          scrollDirection: isRectangle ? Axis.horizontal : Axis.vertical,
          physics: const BouncingScrollPhysics(),
          children: entries
              .map((entry) => RectangleCard(
                  text: entry.text,
                  iconSize: 32,
                  icon: entry.icon,
                  isRectangle: isRectangle,
                  secondText: entry.secondText,
                  isSelected: entry.text == 'I\'m Home',
          ))
              .toList(),
        ));
  }
}
