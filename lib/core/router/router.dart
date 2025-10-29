import 'package:go_router/go_router.dart';

import '../../features/debug/presentation/debug_screen.dart';
import 'router_paths.dart';

/// The application's router using GoRouter.
final router = GoRouter(
  initialLocation: AppRoutePaths.debugPath,
  routes: [
    // Define your app's routes here
    GoRoute(
      path: AppRoutePaths.debugPath,
      builder: (context, state) => const DebugScreen(),
    ),
  ],
);
