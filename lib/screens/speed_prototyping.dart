import 'package:flutter/material.dart';

/*
 * These are the internal dependencies
 */
import 'package:bstevr_assessment/models/icon_entry.dart';
import 'package:bstevr_assessment/commons/text_styles.dart';
import 'package:bstevr_assessment/commons/box_decorations.dart';
import 'package:bstevr_assessment/widgets/quick_actions.dart';
import 'package:bstevr_assessment/widgets/selectable_cards.dart';
import 'package:bstevr_assessment/widgets/custom_app_bar.dart';
import 'package:bstevr_assessment/widgets/custom_navigation_bar.dart';

class SpeedPrototype extends StatelessWidget {
  const SpeedPrototype({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconEntry> quickActionsEntries = [
      IconEntry(icon: Icons.thermostat_outlined, text: '20%'),
      IconEntry(icon: Icons.lock_open_outlined, text: 'Front Door Unlocked'),
      IconEntry(icon: Icons.local_shipping_outlined, text: 'Garage Door Open'),
      IconEntry(icon: Icons.lightbulb_outline, text: '3 Lights On'),
      IconEntry(icon: Icons.microwave_outlined, text: 'Kitchen Is Used'),
    ];
    List<IconEntry> favoriteScenesEntries = [
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
    List<IconEntry> favoriteAccessories = [
      ...favoriteScenesEntries,
      ...[
        IconEntry(icon: Icons.villa, text: 'Kitchen Door', secondText: 'Open'),
        IconEntry(
            icon: Icons.emoji_objects,
            text: 'Hallway Light',
            secondText: '80%'),
        IconEntry(
            icon: Icons.thermostat,
            text: 'Living Room',
            secondText: 'Unlocked'),
        IconEntry(
            icon: Icons.album, text: 'Front Door', secondText: 'Main Door'),
      ]
    ];
    List<IconEntry> bottomNavigationBarItems = [
      IconEntry(icon: Icons.home, text: 'Home'),
      IconEntry(icon: Icons.branding_watermark, text: 'Rooms'),
      IconEntry(icon: Icons.schedule, text: 'Automation')
    ];

    return Container(
      decoration: BoxDecorations.gradient(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(),
        body: Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(left: 5, bottom: 20),
                    child: Text(
                      'My Home',
                      style: TextStyles.header1(),
                    )),
                Flexible(
                    flex: 2, child: QuickActions(entries: quickActionsEntries)),
                Container(
                    margin: const EdgeInsets.only(left: 5, bottom: 15),
                    child: Text(
                      'Favorite Scenes',
                      style: TextStyles.header2(),
                    )),
                Flexible(
                    flex: 3,
                    child: SelectableCards(entries: favoriteScenesEntries)),
                Container(
                    margin: const EdgeInsets.only(left: 5, bottom: 15),
                    child: Text(
                      'Favorite Accessories',
                      style: TextStyles.header2(),
                    )),
                Flexible(
                    flex: 3,
                    child: SelectableCards(
                        entries: favoriteAccessories, isRectangle: false)),
              ],
            )),
        bottomNavigationBar:
            CustomNavigationBar(entries: bottomNavigationBarItems),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {Navigator.pushNamed(context, '/coinDetector')},
          tooltip: 'View Stream',
          child: const Icon(Icons.view_agenda_outlined,
              size: 32, color: Colors.white),
        ),
      ),
    );
  }
}
