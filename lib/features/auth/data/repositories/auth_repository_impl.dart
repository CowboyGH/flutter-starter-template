import 'package:firebase_auth/firebase_auth.dart' as fb;

import '../../../../core/failures/feature/auth/auth_failure.dart';
import '../../../../core/result/result.dart';
import '../../../../core/utils/logger/app_logger.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../mappers/auth_failure_mapper.dart';
import '../mappers/user_to_entity_mapper.dart';

/// Implementation of [AuthRepository] using Firebase Authentication.
///
/// This class handles authentication operations (sign in, sign up, sign out)
/// and converts Firebase-specific errors to domain [AuthFailure] types.
///
/// All operations are logged using [AppLogger] for debugging and monitoring.
class AuthRepositoryImpl implements AuthRepository {
  /// Logger for tracking authentication operations and errors.
  final AppLogger _logger;

  /// Firebase Authentication instance for performing auth operations.
  final fb.FirebaseAuth _auth;

  /// Creates an instance of [AuthRepositoryImpl].
  AuthRepositoryImpl(this._logger, this._auth);

  /// Validates the provided credentials and returns a [Result] containing either
  /// a [User] on success or an [AuthFailure] on failure.
  ///
  /// This is a private helper method used internally by the authentication
  /// repository to verify user credentials before processing login or
  /// registration requests.
  ///
  /// Returns:
  /// - [Result.success] with a [User] object if credentials are valid
  /// - [Result.failure] with an [AuthFailure] if validation fails
  Result<User, AuthFailure> _validateCredential(
    fb.UserCredential credential,
    String operation,
  ) {
    if (credential.user == null) {
      _logger.w('$operation succeeded but user is null', null, StackTrace.current);
      return Result.failure(
        UnknownAuthFailure(
          'unknown',
          originalMessage: 'User is null after $operation',
          stackTrace: StackTrace.current,
        ),
      );
    }
    _logger.i('$operation successful for user: ${credential.user!.uid}');
    return Result.success(credential.user!.toEntity());
  }

  @override
  Future<Result<User, AuthFailure>> signInWithEmail(
    String email,
    String password,
  ) async {
    _logger.d('SignIn attempt for email: $email');
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return _validateCredential(credential, 'sign in');
    } on fb.FirebaseAuthException catch (e, s) {
      _logger.i('SignIn failed with Firebase error: ${e.code}', e, s);
      return Result.failure(e.toAuthFailure(s));
    } catch (e, s) {
      _logger.e('SignIn failed with unexpected error', e, s);
      return Result.failure(
        UnknownAuthFailure(
          'unknown',
          originalMessage: e.toString(),
          parentException: e,
          stackTrace: s,
        ),
      );
    }
  }

  @override
  Future<Result<User, AuthFailure>> signUpWithEmail(
    String email,
    String password,
  ) async {
    _logger.d('SignUp attempt for email: $email');
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return _validateCredential(credential, 'sign up');
    } on fb.FirebaseAuthException catch (e, s) {
      _logger.i('SignUp failed with Firebase error: ${e.code}', e, s);
      return Result.failure(e.toAuthFailure(s));
    } catch (e, s) {
      _logger.e('SignUp failed with unexpected error', e, s);
      return Result.failure(
        UnknownAuthFailure(
          'unknown',
          originalMessage: e.toString(),
          parentException: e,
          stackTrace: s,
        ),
      );
    }
  }

  @override
  Future<Result<void, AuthFailure>> signOut() async {
    _logger.d('SignOut attempt');
    try {
      await _auth.signOut();
      _logger.i('SignOut successful');
      return const Result.success(null);
    } on fb.FirebaseAuthException catch (e, s) {
      _logger.i('SignOut failed with Firebase error: ${e.code}', e, s);
      return Result.failure(e.toAuthFailure(s));
    } catch (e, s) {
      _logger.e('SignOut failed with unexpected error', e, s);
      return Result.failure(
        UnknownAuthFailure(
          'unknown',
          originalMessage: e.toString(),
          parentException: e,
          stackTrace: s,
        ),
      );
    }
  }

  @override
  Stream<User?> get authStateChanges {
    return _auth.authStateChanges().map(
      (fb.User? firebaseUser) {
        if (firebaseUser != null) {
          _logger.d('Auth state changed: user logged in (${firebaseUser.uid})');
          return firebaseUser.toEntity();
        } else {
          _logger.d('Auth state changed: user logged out');
          return null;
        }
      },
    );
  }
}
