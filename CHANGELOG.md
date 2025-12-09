# 📘 Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

### Added

- Implemented base Clean Architecture structure (`core`, `features`, `uikit`) with `data`, `domain`, and `presentation` layers.
- Added all project dependencies from `pubspec.yaml`.
- Integrated `GetIt` for dependency injection.
- Added `DebugScreen` widget for testing and debugging purposes.
- Added application router with `GoRouter` and defined route paths for navigation.
- Integrated `logger` package with `AppLogger` abstraction, DI setup, and global error handling (Flutter & platform-level).
- Integrated `Firebase Core` for authentication and analytics features.
- Integrated `Firebase Crashlytics` for global error handling.
- Added `AppFailure` base class and `UnknownFailure` implementation for unified domain-level error handling.
- Added sealed `Result` abstraction with `Success` and `Failure` implementations, plus `AsyncResult` type alias for standardizing async operation handling.
- Added DI-independent fallback error handler inside runZonedGuarded to ensure reliable error reporting even if DI or Firebase are not ready.
- Added unified analytics architecture with `Firebase Analytics` integration, debug logging, and automatic screen view tracking via `AnalyticsRouteObserver`.
- Added `AppLoggerMixin` for convenient logger access in Bloc/Cubit

### Changed

- Added `public_member_api_docs` rule to `analysis_options.yaml`.
- Extracted main application widget to `app.dart`, added `runner.dart` for app initialization with error handling, and simplified `main.dart`.
- Removed `always_put_control_body_on_new_line` rule from `analysis_options.yaml`.
- Streamlined logger registration in dependency injection setup
- Updated Dart SDK requirement to `>=3.10.0` (was `>=3.9.2`)
- Updated Flutter SDK requirement to `>=3.10.0`

### Fixed

- Moved `WidgetsFlutterBinding.ensureInitialized()` inside `runZonedGuarded` in `runner.dart` to ensure proper app initialization and error handling.
- Fixed code generation failure by updating `retrofit_generator` (compatibility with `analyzer` 7.7.1+).

---

## [0.1.0] - 2025-10-29

### Added

- Initial Flutter project created via `flutter create`.
- Added core documentation files and base configuration.

*This changelog was initialized with the project setup (initial commit). Future changes will be tracked starting from version 0.1.0.*
