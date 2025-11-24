import 'package:go_router/go_router.dart';

import '../../features/debug/presentation/debug_screen.dart';
import '../di/di.dart';
import '../utils/analytics/app_analytics.dart';
import 'analytics_route_observer.dart';
import 'router_paths.dart';

/// The application's router using GoRouter.
final router = GoRouter(
  initialLocation: AppRoutePaths.debugPath,
  observers: [
    AnalyticsRouteObserver(di<AppAnalytics>()),
  ],
  routes: [
    // Define your app's routes here
    GoRoute(
      path: AppRoutePaths.debugPath,
      builder: (context, state) => const DebugScreen(),
    ),
  ],
);
