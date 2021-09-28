import 'package:flutter/material.dart';

/*
 * These are the internal dependencies for the widget below
 */
import 'package:bstevr_assessment/widgets/circle_card.dart';

class QuickActions extends StatelessWidget {
  /*
   * The props, meaning these are not gonna change
   * during lifetime of the component
   */
  final List<dynamic> entries;

  const QuickActions({Key? key, required this.entries}) : super(key: key);

  /*
   * The rendering method, in which the component tells
   * how it should show itself.
   */
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: entries.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => CircleCard(
                text: entries[index].text,
                iconSize: 64,
                icon: entries[index].icon)));
  }
}
