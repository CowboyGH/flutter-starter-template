import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

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
}
