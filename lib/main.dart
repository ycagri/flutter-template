import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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

  GoRouter _buildRouter() => GoRouter(initialLocation: '/', routes: []);
}
