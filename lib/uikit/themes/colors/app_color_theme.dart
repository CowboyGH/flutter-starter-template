//ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart';

import 'app_colors.dart';

/// A class that defines the color theme of the app.
@immutable
class AppColorTheme extends ThemeExtension<AppColorTheme> {
  static AppColorTheme of(BuildContext context) =>
      Theme.of(context).extension<AppColorTheme>() ?? _throwThemeNotFound(context);

  final Color primary;
  final Color onPrimary;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color error;
  final Color onError;
  final Color success;
  final Color warning;
  final Color border;
  final Color disabled;

  const AppColorTheme._({
    required this.primary,
    required this.onPrimary,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.error,
    required this.onError,
    required this.success,
    required this.warning,
    required this.border,
    required this.disabled,
  });

  const AppColorTheme.light()
    : primary = AppColors.lightPrimary,
      onPrimary = AppColors.lightOnPrimary,
      background = AppColors.lightBackground,
      onBackground = AppColors.lightOnBackground,
      surface = AppColors.lightSurface,
      onSurface = AppColors.lightOnSurface,
      error = AppColors.lightError,
      onError = AppColors.lightOnError,
      success = AppColors.lightSuccess,
      warning = AppColors.lightWarning,
      border = AppColors.lightBorder,
      disabled = AppColors.lightDisabled;

  const AppColorTheme.dark()
    : primary = AppColors.darkPrimary,
      onPrimary = AppColors.darkOnPrimary,
      background = AppColors.darkBackground,
      onBackground = AppColors.darkOnBackground,
      surface = AppColors.darkSurface,
      onSurface = AppColors.darkOnSurface,
      error = AppColors.darkError,
      onError = AppColors.darkOnError,
      success = AppColors.darkSuccess,
      warning = AppColors.darkWarning,
      border = AppColors.darkBorder,
      disabled = AppColors.darkDisabled;

  @override
  ThemeExtension<AppColorTheme> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? error,
    Color? onError,
    Color? success,
    Color? warning,
    Color? border,
    Color? disabled,
  }) {
    return AppColorTheme._(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      border: border ?? this.border,
      disabled: disabled ?? this.disabled,
    );
  }

  @override
  ThemeExtension<AppColorTheme> lerp(covariant ThemeExtension<AppColorTheme>? other, double t) {
    if (other is! AppColorTheme) {
      return this;
    }
    return AppColorTheme._(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      border: Color.lerp(border, other.border, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
    );
  }
}

Never _throwThemeNotFound(BuildContext context) =>
    throw Exception('$AppColorTheme not found in $context');
