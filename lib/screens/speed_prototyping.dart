import 'package:flutter/material.dart';

/*
 * These are the internal dependencies
 */
import 'package:bstevr_assessment/utilities/helper_methods.dart';
import 'package:bstevr_assessment/commons/text_styles.dart';
import 'package:bstevr_assessment/commons/box_decorations.dart';
import 'package:bstevr_assessment/widgets/quick_actions.dart';
import 'package:bstevr_assessment/widgets/selectable_cards.dart';
import 'package:bstevr_assessment/widgets/custom_app_bar.dart';
import 'package:bstevr_assessment/widgets/custom_navigation_bar.dart';

class SpeedPrototyping extends StatelessWidget {
  final List<dynamic> quickActionsEntries;
  final List<dynamic> favoriteScenesEntries;
  final List<dynamic> favoriteAccessoriesEntries;
  final List<dynamic> bottomNavigationBarItems;

  SpeedPrototyping(
      {Key? key})
      : quickActionsEntries = getQuickActionsEntries(),
        favoriteScenesEntries = getFavoriteScenesEntries(),
        favoriteAccessoriesEntries = getFavoriteAccessoriesEntries(),
        bottomNavigationBarItems = getBottomNavigationBarItems(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        entries: favoriteAccessoriesEntries, isRectangle: false)),
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
