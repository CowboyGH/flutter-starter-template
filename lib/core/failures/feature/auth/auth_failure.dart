import '../../app_failure.dart';

/// Auth application error.
sealed class AuthFailure extends AppFailure {
  /// Error code.
  abstract final String code;

  /// Creates an instance of [AuthFailure].
  const AuthFailure(
    super.message, {
    super.parentException,
    super.stackTrace,
  });
}

/// Invalid credential error.
final class InvalidCredentialFailure extends AuthFailure {
  @override
  String get code => 'invalid-credential';

  ///
  const InvalidCredentialFailure({
    super.parentException,
    super.stackTrace,
  }) : super('');
}

/// Weak password error.
final class WeakPasswordFailure extends AuthFailure {
  @override
  String get code => 'weak-password';

  ///
  const WeakPasswordFailure({
    super.parentException,
    super.stackTrace,
  }) : super('');
}

/// Wrong password error.
final class WrongPasswordFailure extends AuthFailure {
  @override
  String get code => 'wrong-password';

  ///
  const WrongPasswordFailure({
    super.parentException,
    super.stackTrace,
  }) : super('');
}

/// Invalid email error.
final class InvalidEmailFailure extends AuthFailure {
  @override
  String get code => 'invalid-email';

  ///
  const InvalidEmailFailure({
    super.parentException,
    super.stackTrace,
  }) : super('');
}

/// Email already in use error.
final class EmailAlreadyInUseFailure extends AuthFailure {
  @override
  String get code => 'email-already-in-use';

  ///
  const EmailAlreadyInUseFailure({
    super.parentException,
    super.stackTrace,
  }) : super('');
}

/// User disabled error.
final class UserDisabledFailure extends AuthFailure {
  @override
  String get code => 'user-disabled';

  ///
  const UserDisabledFailure({
    super.parentException,
    super.stackTrace,
  }) : super('');
}

/// User token expired error.
final class UserTokenExpiredFailure extends AuthFailure {
  @override
  String get code => 'user-token-expired';

  ///
  const UserTokenExpiredFailure({
    super.parentException,
    super.stackTrace,
  }) : super('');
}

/// User not found error.
final class UserNotFoundFailure extends AuthFailure {
  @override
  String get code => 'user-not-found';

  ///
  const UserNotFoundFailure({
    super.parentException,
    super.stackTrace,
  }) : super('');
}

/// Operation not allowed error.
final class OperationNotAllowed extends AuthFailure {
  @override
  String get code => 'operation-not-allowed';

  ///
  const OperationNotAllowed({
    super.parentException,
    super.stackTrace,
  }) : super('');
}

/// Too many requests error.
final class TooManyRequestsFailure extends AuthFailure {
  @override
  String get code => 'too-many-requests';

  ///
  const TooManyRequestsFailure({
    super.parentException,
    super.stackTrace,
  }) : super('');
}

/// Network request failed error.
final class NetworkRequestFailedFailure extends AuthFailure {
  @override
  String get code => 'network-request-failed';

  ///
  const NetworkRequestFailedFailure({
    super.parentException,
    super.stackTrace,
  }) : super('');
}

/// Unknown authentication error.
final class UnknownAuthFailure extends AuthFailure {
  @override
  final String code;

  ///
  final String? originalMessage;

  ///
  const UnknownAuthFailure(
    this.code, {
    this.originalMessage,
    super.parentException,
    super.stackTrace,
  }) : super(originalMessage ?? 'Unknown authentication error');
}
