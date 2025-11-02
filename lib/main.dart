import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/home/home_page.dart';
import 'package:flutter_template/leaderboard/leaderboard_page.dart';
import 'package:flutter_template/profile/profile_page.dart';
import 'package:flutter_template/sign_in/sign_in_page.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';

import 'common/theme.dart';
import 'di/injection.dart';
import 'l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp.router(
    onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
    theme: appTheme,
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [Locale('en'), Locale('tr')],
    routerConfig: _buildRouter(),
  );

  GoRouter _buildRouter() => GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: HomePage.path,
        name: HomePage.name,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: LeaderboardPage.path,
        name: LeaderboardPage.name,
        builder: (context, state) => const LeaderboardPage(),
      ),
      GoRoute(
        path: ProfilePage.path,
        name: ProfilePage.name,
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: SignInPage.path,
        name: SignInPage.name,
        builder: (context, state) => const SignInPage(),
      ),
    ],
  );
}
