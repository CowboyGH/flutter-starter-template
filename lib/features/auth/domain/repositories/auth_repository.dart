import '../../../../core/failures/feature/auth/auth_failure.dart';
import '../../../../core/result/result.dart';
import '../entities/user.dart';

/// Repository interface for authentication operations.
abstract interface class AuthRepository {
  /// Signs in a user with email and password.
  ///
  /// Returns:
  /// - [Result.success] with [User] if authentication succeeds.
  /// - [Result.failure] with [AuthFailure] if authentication fails.
  Future<Result<User, AuthFailure>> signInWithEmail(String email, String password);

  /// Creates a new user account with email and password.
  ///
  /// Returns:
  /// - [Result.success] with [User] if account creation succeeds.
  /// - [Result.failure] with [AuthFailure] if creation fails.
  Future<Result<User, AuthFailure>> signUpWithEmail(String email, String password);

  /// Signs out the currently authenticated user.
  ///
  /// Returns:
  /// - [Result.success] with `null` if sign out succeeds.
  /// - [Result.failure] with [AuthFailure] if sign out fails.
  Future<Result<void, AuthFailure>> signOut();

  /// Stream of authentication state changes.
  ///
  /// Emits:
  /// - [User] when a user is signed in
  /// - `null` when no user is signed in
  Stream<User?> get authStateChanges;
}
