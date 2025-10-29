import 'package:get_it/get_it.dart';

/// Global instance of the GetIt service locator for dependency management.
final di = GetIt.instance;

/// Initializes the application's dependencies using GetIt.
void setupDI() {
  // Register your dependencies here, for example:
  // di.registerLazySingleton<SomeService>(() => SomeServiceImpl());
}
