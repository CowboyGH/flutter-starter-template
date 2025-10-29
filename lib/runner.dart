import 'dart:async';

import 'package:flutter/material.dart';

import 'features/app/app.dart';

/// The main entry point of the application.
void run() {
  WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded(
    () {
      runApp(const FlutterStarterTemplate());
    },
    (error, stackTrace) {
      debugPrint('Uncaught error: $error');
      debugPrint('Stack trace: $stackTrace');
    },
  );
}
