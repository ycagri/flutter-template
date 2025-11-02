import 'package:flutter/material.dart';
import 'package:flutter_template/l10n/app_localizations.dart';

abstract class BottomNavigationPage extends StatelessWidget {
  final int currentIndex;

  const BottomNavigationPage({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar:
        title(context) == null
            ? null
            : AppBar(
              title: Text(title(context)!),
              actions: buildActions(context),
            ),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: currentIndex,
      items: getBottomNavigationItems(context),
      type: BottomNavigationBarType.fixed,
      onTap: (index) => onTabSelected(context, index),
    ),
    body: buildBody(context),
  );

  // Default Tabs
  List<BottomNavigationBarItem> getBottomNavigationItems(
    BuildContext context,
  ) => [
    BottomNavigationBarItem(
      icon: const Icon(Icons.home),
      label: AppLocalizations.of(context)!.home,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.leaderboard),
      label: AppLocalizations.of(context)!.leaderboard,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.person),
      label: AppLocalizations.of(context)!.profile,
    ),
  ];

  Widget buildBody(BuildContext context);

  String? title(BuildContext context);

  List<Widget> buildActions(BuildContext context) => [];

  @protected
  void onTabSelected(BuildContext context, int selectedTab);
}
