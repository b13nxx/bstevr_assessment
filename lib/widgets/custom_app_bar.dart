import 'package:flutter/material.dart';

/*
 * These are the internal dependencies
 */
import 'package:bstevr_assessment/widgets/toggle_status.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /*
   * The props, meaning these are not gonna change
   * during lifetime of the component
   */
  final String appTitle;
  final bool includeToggle;
  final bool isToggleOn;
  final bool isToggleDisabled;
  final Function(bool value) onToggleChanged;
  final double size;

  CustomAppBar(
      {Key? key,
      this.appTitle = '',
      this.isToggleOn = true,
      this.isToggleDisabled = false,
      this.includeToggle = false,
      Function(bool value)? onToggleChanged,
      this.size = 70})
      : onToggleChanged = onToggleChanged ?? ((bool value) => {}),
        super(key: key);

  /*
   * The rendering method, in which the component tells
   * how it should show itself
   */
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: includeToggle
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop())
          : IconButton(icon: const Icon(Icons.home), onPressed: () {}),
      title: includeToggle ? Text(appTitle) : Container(),
      actions: includeToggle
          ? [
              ToggleStatus(
                isOn: isToggleOn,
                isDisabled: isToggleDisabled,
                onChanged: onToggleChanged,
              )
            ]
          : [IconButton(icon: const Icon(Icons.add), onPressed: () {})],
      bottomOpacity: 0.0,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size);
}
