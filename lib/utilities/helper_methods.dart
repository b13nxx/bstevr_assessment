import 'package:flutter/material.dart';

/*
 * These are the internal dependencies
 */
import 'package:bstevr_assessment/models/icon_entry.dart';

/*
 * These are helper logics potentially be used across whole project
 */
String getTimePassed(DateTime date) {
  Duration difference = DateTime.now().difference(date);

  if (difference.inHours >= 1) {
    return '${difference.inHours}h ${difference.inMinutes - (difference.inHours * 60)}m ${difference.inSeconds - (difference.inMinutes * 60)}s';
  } else if (difference.inMinutes >= 1) {
    return '${difference.inMinutes}m ${difference.inSeconds - (difference.inMinutes * 60)}s';
  }

  return '${difference.inSeconds}s';
}

List<IconEntry> getQuickActionsEntries() {
  return [
    IconEntry(icon: Icons.thermostat_outlined, text: '20%'),
    IconEntry(icon: Icons.lock_open_outlined, text: 'Front Door Unlocked'),
    IconEntry(icon: Icons.local_shipping_outlined, text: 'Garage Door Open'),
    IconEntry(icon: Icons.lightbulb_outline, text: '3 Lights On'),
    IconEntry(icon: Icons.microwave_outlined, text: 'Kitchen Is Used'),
  ];
}

List<IconEntry> getFavoriteScenesEntries() {
  return [
    IconEntry(
        icon: Icons.self_improvement, text: 'I\'m Home', secondText: 'Open'),
    IconEntry(
        icon: Icons.time_to_leave, text: 'I\'m Leaving', secondText: '80%'),
    IconEntry(
        icon: Icons.wb_sunny, text: 'Good Morning', secondText: 'Unlocked'),
    IconEntry(
        icon: Icons.nightlight,
        text: 'Good Night',
        secondText: 'Heating to 71%'),
  ];
}

List<IconEntry> getFavoriteAccessoriesEntries() {
  return [
    ...getFavoriteScenesEntries(),
    ...[
      IconEntry(icon: Icons.villa, text: 'Kitchen Door', secondText: 'Open'),
      IconEntry(
          icon: Icons.emoji_objects, text: 'Hallway Light', secondText: '80%'),
      IconEntry(
          icon: Icons.thermostat, text: 'Living Room', secondText: 'Unlocked'),
      IconEntry(icon: Icons.album, text: 'Front Door', secondText: 'Main Door'),
    ]
  ];
}

List<IconEntry> getBottomNavigationBarItems() {
  return [
    IconEntry(icon: Icons.home, text: 'Home'),
    IconEntry(icon: Icons.branding_watermark, text: 'Rooms'),
    IconEntry(icon: Icons.schedule, text: 'Automation')
  ];
}
