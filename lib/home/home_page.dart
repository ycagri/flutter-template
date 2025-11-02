import 'package:flutter/material.dart';
import 'package:flutter_template/l10n/app_localizations.dart';
import 'package:flutter_template/leaderboard/leaderboard_page.dart';
import 'package:flutter_template/profile/profile_page.dart';
import 'package:flutter_template/widget/bottom_navigation_page.dart';
import 'package:go_router/go_router.dart';

class HomePage extends BottomNavigationPage {
  static const index = 0;
  static const String name = 'home';
  static const String path = '/';

  const HomePage({super.key}) : super(currentIndex: index);

  @override
  Widget buildBody(BuildContext context) =>
      Center(child: Text(AppLocalizations.of(context)!.home));

  @override
  String? title(BuildContext context) => AppLocalizations.of(context)!.appName;

  @override
  void onTabSelected(BuildContext context, int selectedTab) {
    if (selectedTab == LeaderboardPage.index) {
      context.goNamed(LeaderboardPage.name);
    } else if (selectedTab == ProfilePage.index) {
      context.goNamed(ProfilePage.name);
    }
  }
}
