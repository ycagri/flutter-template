import 'package:flutter/material.dart';
import 'package:flutter_template/home/home_page.dart';
import 'package:go_router/go_router.dart';

import '../l10n/app_localizations.dart';
import '../profile/profile_page.dart';
import '../widget/bottom_navigation_page.dart';

class LeaderboardPage extends BottomNavigationPage {
  static const index = 1;
  static const String name = 'leaderboard';
  static const String path = '/leaderboard';

  const LeaderboardPage({super.key}) : super(currentIndex: index);

  @override
  Widget buildBody(BuildContext context) =>
      Center(child: Text(AppLocalizations.of(context)!.leaderboard));

  @override
  String? title(BuildContext context) =>
      AppLocalizations.of(context)!.leaderboard;

  @override
  void onTabSelected(BuildContext context, int selectedTab) {
    if (selectedTab == HomePage.index) {
      context.goNamed(HomePage.name);
    } else if (selectedTab == ProfilePage.index) {
      context.goNamed(ProfilePage.name);
    }
  }
}
