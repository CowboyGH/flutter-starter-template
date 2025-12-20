/// A base failure type used in the business logic layer.
///
/// This class represents domain-level errors that wrap lower-level exceptions
/// and provide meaningful context for application logic.
abstract class AppFailure<T extends Object?> implements Exception {
  /// A message describing the failure.
  final String message;

  /// The original exception that caused this failure, if any.
  final T? parentException;

  /// The stack trace at the point where the failure was created, if any.
  final StackTrace? stackTrace;

  /// Creates an instance of [AppFailure].
  const AppFailure(this.parentException, this.message, this.stackTrace);
}
