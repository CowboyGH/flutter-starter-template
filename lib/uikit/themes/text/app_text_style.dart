//ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart';

/// The text styles used in the app.
abstract class AppTextStyle {
  static const display = TextStyle(
    fontSize: 28,
    height: 1.25,
    fontWeight: FontWeight.w700,
  );

  static const title = TextStyle(
    fontSize: 20,
    height: 1.3,
    fontWeight: FontWeight.w600,
  );

  static const body = TextStyle(
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  static const bodySmall = TextStyle(
    fontSize: 14,
    height: 1.45,
    fontWeight: FontWeight.w400,
  );

  static const label = TextStyle(
    fontSize: 12,
    height: 1.35,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
  );

  static const button = TextStyle(
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w600,
  );
}
