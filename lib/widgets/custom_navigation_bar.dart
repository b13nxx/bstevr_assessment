import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  /*
   * The props, meaning these are not gonna change
   * during lifetime of the component
   */
  final List<dynamic> entries;

  const CustomNavigationBar({Key? key, required this.entries})
      : super(key: key);

  /*
   * By including this line, it converts our component to stateful one
   * that means our component has some sort of data
   * which will change during lifetime of the component
   */
  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  /*
   * The state, basically data that changes over time
   */
  int _selectedIndex = 0;

  /*
   * These are inner logics that will change the state of the component
   */
  void _toggleBarItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /*
   * The rendering method, in which the component tells
   * how it should show itself
   */
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: widget.entries
          .map((entry) => BottomNavigationBarItem(
                icon: Icon(entry.icon, color: Colors.grey),
                activeIcon: Icon(
                  entry.icon,
                  color: Colors.orange,
                  size: 32,
                ),
                label: entry.text,
              ))
          .toList(),
      selectedLabelStyle: const TextStyle(color: Colors.orange),
      selectedItemColor: Colors.orange,
      onTap: _toggleBarItem,
      currentIndex: _selectedIndex,
    );
  }
}
