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

### Changed
- Added `public_member_api_docs` rule to `analysis_options.yaml`.
- Extracted main application widget to `app.dart`, added `runner.dart` for app initialization with error handling, and simplified `main.dart`.

### Fixed
- Moved `WidgetsFlutterBinding.ensureInitialized()` inside `runZonedGuarded` in `runner.dart` to ensure proper app initialization and error handling.

---

## [0.1.0] - 2025-10-29
### Added
- Initial Flutter project created via `flutter create`.
- Added core documentation files and base configuration.

*This changelog was initialized with the project setup (initial commit). Future changes will be tracked starting from version 0.1.0.*