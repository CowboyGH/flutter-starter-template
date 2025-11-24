import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../utils/analytics/app_analytics.dart';
import '../utils/analytics/debug_analytics_impl.dart';
import '../utils/analytics/firebase_analytics_impl.dart';
import '../utils/logger/app_logger.dart';
import '../utils/logger/app_logger_impl.dart';
import '../utils/logger/logger_setup.dart';

/// Global instance of the GetIt service locator for dependency management.
final di = GetIt.instance;

/// Initializes the application's dependencies using GetIt.
void setupDI() {
  // Register your dependencies here, for example:
  // di.registerLazySingleton<SomeService>(() => SomeServiceImpl());

  // Logger
  final logger = createLogger();

  di.registerLazySingleton<Logger>(() => logger);
  di.registerLazySingleton<AppLogger>(() => AppLoggerImpl(di<Logger>()));

  // Firebase Analytics
  di.registerLazySingleton<FirebaseAnalytics>(() => FirebaseAnalytics.instance);
  di.registerLazySingleton<AppAnalytics>(
    () => kReleaseMode
        ? FirebaseAnalyticsImpl(di<FirebaseAnalytics>())
        : DebugAnalyticsImpl(di<AppLogger>()),
  );
}
