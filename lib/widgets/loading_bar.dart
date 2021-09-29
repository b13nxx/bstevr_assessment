import 'package:flutter/material.dart';

/*
 * These are the internal dependencies for the widget below
 */
import 'package:bstevr_assessment/commons/text_styles.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({Key? key}) : super(key: key);

  /*
   * The rendering method, in which the component tells
   * how it should show itself.
   */
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: const CircularProgressIndicator()),
        Text('Loading',
            style: TextStyles.important())
      ]
    );
  }
}
