import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'core/di/di.dart';
import 'core/utils/logger/app_logger.dart';
import 'features/app/app.dart';

/// The main entry point of the application.
Future<void> run() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Setup dependency injection
      setupDI();
      final logger = di<AppLogger>();

      // Catch errors from Flutter framework
      FlutterError.onError = (details) {
        logger.e('FlutterError', details.exception, details.stack);
        // TODO: forward to Crashlytics
      };

      // Catch errors from outside Flutter framework
      PlatformDispatcher.instance.onError = (error, stack) {
        logger.f('PlatformDispatcherError', error, stack);
        // TODO: forward to Crashlytics
        return true;
      };

      runApp(const FlutterStarterTemplate());
    },
    (error, stackTrace) => di<AppLogger>().f('UncaughtZoneError', error, stackTrace),
  );
}
