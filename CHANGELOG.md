# 📘 Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

### Changed

- Changed `AppFailure` constructor: `message` is now a positional parameter (API change).
- Removed `AsyncResult<T>` type alias (deleted `async_result.dart`).

### Fixed

- Updated `AppFailure` constructor to match new `AppFailure` signature.

## [0.2.0] - 2025-12-20

### Added

- Implemented base Clean Architecture structure (`core`, `features`, `uikit`) with `data`, `domain`, and `presentation` layers.
- Added project dependencies from `pubspec.yaml`.
- Integrated `GetIt` for dependency injection.
- Added `DebugScreen` widget for testing and debugging purposes.
- Added application router with `GoRouter` and defined route paths for navigation.
- Integrated `logger` package with `AppLogger` abstraction, DI setup, and global error handling (Flutter & platform-level).
- Integrated `Firebase Core` for authentication and analytics features.
- Integrated `Firebase Crashlytics` for global error handling.
- Added `AppFailure` base class and `UnknownFailure` implementation for unified domain-level error handling.
- Added sealed `Result` abstraction with `Success` and `Failure` implementations, plus `AsyncResult` type alias for standardizing async operation handling.
- Added DI-independent fallback error handler inside `runZonedGuarded` to ensure reliable error reporting even if DI or Firebase are not ready.
- Added unified analytics architecture with `Firebase Analytics` integration, debug logging, and automatic screen view tracking via `AnalyticsRouteObserver`.
- Added `AppLoggerMixin` for convenient logger access in Bloc/Cubit.
- Added CI/CD pipeline with GitHub Actions:
  - Multi-stage Dockerfile with Flutter 3.38.4 and Android SDK 35.
  - Support for split APK by ABI (armeabi-v7a, arm64-v8a, x86_64).
  - `.dockerignore` for optimized build context.
  - Workflow jobs: code analysis, Android build (Docker + DockerHub), iOS build (macOS runner).
  - Artifact uploads and build summaries.
- Added `NetworkService` for monitoring network availability with `connectivity_plus` integration and unit tests.

### Changed

- Updated `analysis_options.yaml` (including enabling `public_member_api_docs`).
- Refactored app startup:
  - Extracted main application widget to `app.dart`.
  - Added `runner.dart` for app initialization and error handling.
  - Simplified `main.dart`.
- Streamlined logger registration in dependency injection setup.
- Updated Dart SDK constraint to `>=3.10.0 <4.0.0`.

### Fixed

- Moved `WidgetsFlutterBinding.ensureInitialized()` inside `runZonedGuarded` in `runner.dart` to ensure proper app initialization and error handling.
- Fixed code generation failure by updating `retrofit_generator` for compatibility with newer `analyzer` versions.

## [0.1.0] - 2025-10-29

### Added

- Initial Flutter project created via `flutter create`.
- Added core documentation files and base configuration.
