import 'package:flutter/material.dart';
import 'package:flutter_template/common/theme.dart';
import 'package:flutter_template/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

wrapForTesting({GoRouter? router, required Widget child}) {
  final app = MaterialApp(
    theme: appTheme,
    localizationsDelegates: const [AppLocalizations.delegate],
    home: child,
  );

  return router == null ? app : InheritedGoRouter(goRouter: router, child: app);
}
