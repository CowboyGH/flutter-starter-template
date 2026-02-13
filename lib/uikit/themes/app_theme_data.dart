import 'package:flutter/material.dart';

import 'colors/app_color_theme.dart';
import 'text/app_text_theme.dart';

/// The main theme data for the app.
abstract class AppThemeData {
  static const _lightColorTheme = AppColorTheme.light();
  static const _darkColorTheme = AppColorTheme.dark();
  static const _textTheme = AppTextTheme.base();

  /// The light theme of the app.
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: _lightColorTheme.primary,
      onPrimary: _lightColorTheme.onPrimary,
      surface: _lightColorTheme.surface,
      onSurface: _lightColorTheme.onSurface,
      error: _lightColorTheme.error,
      onError: _lightColorTheme.onError,
    ),
    scaffoldBackgroundColor: _lightColorTheme.background,
    appBarTheme: AppBarTheme(
      backgroundColor: _lightColorTheme.surface,
      foregroundColor: _lightColorTheme.onSurface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: _textTheme.title.copyWith(color: _lightColorTheme.onSurface),
    ),
    textTheme: TextTheme(
      displayLarge: _textTheme.display.copyWith(color: _lightColorTheme.onBackground),
      titleLarge: _textTheme.title.copyWith(color: _lightColorTheme.onBackground),
      bodyLarge: _textTheme.body.copyWith(color: _lightColorTheme.onBackground),
      bodyMedium: _textTheme.body.copyWith(color: _lightColorTheme.onSurface),
      bodySmall: _textTheme.bodySmall.copyWith(color: _lightColorTheme.onSurface),
      labelLarge: _textTheme.button.copyWith(color: _lightColorTheme.onPrimary),
      labelSmall: _textTheme.label.copyWith(color: _lightColorTheme.onSurface),
    ),
    dividerColor: _lightColorTheme.border,
    splashFactory: NoSplash.splashFactory,
    extensions: [_lightColorTheme, _textTheme],
  );

  /// The dark theme of the app.
  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: _darkColorTheme.primary,
      onPrimary: _darkColorTheme.onPrimary,
      surface: _darkColorTheme.surface,
      onSurface: _darkColorTheme.onSurface,
      error: _darkColorTheme.error,
      onError: _darkColorTheme.onError,
    ),
    scaffoldBackgroundColor: _darkColorTheme.background,
    appBarTheme: AppBarTheme(
      backgroundColor: _darkColorTheme.surface,
      foregroundColor: _darkColorTheme.onSurface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: _textTheme.title.copyWith(color: _darkColorTheme.onSurface),
    ),
    textTheme: TextTheme(
      displayLarge: _textTheme.display.copyWith(color: _darkColorTheme.onBackground),
      titleLarge: _textTheme.title.copyWith(color: _darkColorTheme.onBackground),
      bodyLarge: _textTheme.body.copyWith(color: _darkColorTheme.onBackground),
      bodyMedium: _textTheme.body.copyWith(color: _darkColorTheme.onSurface),
      bodySmall: _textTheme.bodySmall.copyWith(color: _darkColorTheme.onSurface),
      labelLarge: _textTheme.button.copyWith(color: _darkColorTheme.onPrimary),
      labelSmall: _textTheme.label.copyWith(color: _darkColorTheme.onSurface),
    ),
    dividerColor: _darkColorTheme.border,
    splashFactory: NoSplash.splashFactory,
    extensions: [_darkColorTheme, _textTheme],
  );
}
