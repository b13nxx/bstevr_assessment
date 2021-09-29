import 'package:flutter/material.dart';

class ToggleStatus extends StatelessWidget {
  /*
   * The props, meaning these are not gonna change
   * during lifetime of the component
   */
  final bool isOn;
  final bool isDisabled;
  final Function(bool value) onChanged;

  const ToggleStatus(
      {Key? key,
      required this.isOn,
      required this.isDisabled,
      required this.onChanged})
      : super(key: key);

  /*
   * The rendering method, in which the component tells
   * how it should show itself
   */
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Center(
            child: Text(isOn ? 'Running' : 'Paused',
                style: TextStyle(
                    color: isDisabled
                        ? Colors.white.withOpacity(0.6)
                        : Colors.white))),
        Switch(onChanged: isDisabled ? null : onChanged, value: isOn)
      ],
    );
  }
}
