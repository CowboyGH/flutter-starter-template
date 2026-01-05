import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter_starter_template/core/failures/feature/auth/auth_failure.dart';
import 'package:flutter_starter_template/core/utils/logger/app_logger.dart';
import 'package:flutter_starter_template/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_starter_template/features/auth/domain/entities/user.dart';
import 'package:flutter_starter_template/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AppLogger>(),
  MockSpec<fb.FirebaseAuth>(),
  MockSpec<fb.UserCredential>(),
  MockSpec<fb.User>(),
])
void main() {
  late MockAppLogger mockLogger;
  late MockFirebaseAuth mockAuth;
  late MockUserCredential mockCredential;
  late MockUser mockUser;
  late AuthRepository repository;

  setUp(() {
    mockLogger = MockAppLogger();
    mockAuth = MockFirebaseAuth();
    mockCredential = MockUserCredential();
    mockUser = MockUser();
    repository = AuthRepositoryImpl(mockLogger, mockAuth);
  });

  group('AuthRepositoryImpl', () {
    const String uid = 'test_uid';
    const String email = 'test@gmail.com';
    const String password = 'test_password';
    const code = 'test_code';
    const message = 'test_message';

    void arrangeSuccessfulCredential() {
      when(mockUser.uid).thenReturn(uid);
      when(mockUser.email).thenReturn(email);
      when(mockCredential.user).thenReturn(mockUser);
    }

    void arrangeNullCredential() {
      when(mockCredential.user).thenReturn(null);
    }

    group('AuthRepositoryImpl.signInWithEmail', () {
      test('should return Success with User when valid credentials provided', () async {
        // Arrange
        arrangeSuccessfulCredential();

        when(
          mockAuth.signInWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).thenAnswer((_) async => mockCredential);

        // Act
        final result = await repository.signInWithEmail(email, password);
        final user = result.success!;

        // Assert
        expect(result.isSuccess, true);

        expect(user.uid, uid);
        expect(user.email, email);

        verify(
          mockAuth.signInWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).called(1);
        verifyNoMoreInteractions(mockAuth);
      });

      test('should return UnknownAuthFailure when credential.user is null', () async {
        // Arrange
        arrangeNullCredential();

        when(
          mockAuth.signInWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).thenAnswer((_) async => mockCredential);

        // Act
        final result = await repository.signInWithEmail(email, password);
        final failure = result.failure;

        // Assert
        expect(result.isFailure, true);
        expect(failure, isA<UnknownAuthFailure>());

        verify(
          mockAuth.signInWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).called(1);
        verifyNoMoreInteractions(mockAuth);
      });

      test('should return AuthFailure when FirebaseAuthException thrown', () async {
        // Arrange
        when(
          mockAuth.signInWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).thenThrow(
          fb.FirebaseAuthException(
            code: code,
            message: message,
          ),
        );

        // Act
        final result = await repository.signInWithEmail(
          email,
          password,
        );
        final failure = result.failure!;

        // Assert
        expect(result.isFailure, true);

        expect(failure, isA<AuthFailure>());
        expect(failure.code, code);
        expect(failure.message, message);

        verify(
          mockAuth.signInWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).called(1);
        verifyNoMoreInteractions(mockAuth);
      });

      test('should return UnknownAuthFailure when unexpected error thrown', () async {
        // Arrange
        when(
          mockAuth.signInWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).thenThrow(Object());

        // Act
        final result = await repository.signInWithEmail(email, password);
        final failure = result.failure!;

        // Assert
        expect(result.isFailure, true);
        expect(failure, isA<UnknownAuthFailure>());

        verify(
          mockAuth.signInWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).called(1);
        verifyNoMoreInteractions(mockAuth);
      });
    });

    group('AuthRepositoryImpl.signUpWithEmail', () {
      test('should return Success with User when valid credentials provided', () async {
        // Arrange
        arrangeSuccessfulCredential();

        when(
          mockAuth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).thenAnswer((_) async => mockCredential);

        // Act
        final result = await repository.signUpWithEmail(email, password);
        final user = result.success!;

        // Assert
        expect(result.isSuccess, true);

        expect(user.uid, uid);
        expect(user.email, email);

        verify(
          mockAuth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).called(1);
        verifyNoMoreInteractions(mockAuth);
      });

      test('should return UnknownAuthFailure when credential.user is null', () async {
        // Arrange
        arrangeNullCredential();

        when(
          mockAuth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).thenAnswer((_) async => mockCredential);

        // Act
        final result = await repository.signUpWithEmail(email, password);
        final failure = result.failure!;

        // Assert
        expect(result.isFailure, true);
        expect(failure, isA<UnknownAuthFailure>());

        verify(
          mockAuth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).called(1);
        verifyNoMoreInteractions(mockAuth);
      });

      test('should return AuthFailure when FirebaseAuthException thrown', () async {
        // Arrange
        when(
          mockAuth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).thenThrow(
          fb.FirebaseAuthException(
            code: code,
            message: message,
          ),
        );

        // Act
        final result = await repository.signUpWithEmail(email, password);
        final failure = result.failure!;

        // Assert
        expect(result.isFailure, true);

        expect(failure, isA<AuthFailure>());
        expect(failure.code, code);
        expect(failure.message, message);

        verify(
          mockAuth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).called(1);
        verifyNoMoreInteractions(mockAuth);
      });

      test('should return UnknownAuthFailure when unexpected error thrown', () async {
        // Arrange
        when(
          mockAuth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).thenThrow(Object());

        // Act
        final result = await repository.signUpWithEmail(email, password);
        final failure = result.failure!;

        // Assert
        expect(result.isFailure, true);
        expect(failure, isA<UnknownAuthFailure>());

        verify(
          mockAuth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).called(1);
        verifyNoMoreInteractions(mockAuth);
      });
    });

    group('AuthRepositoryImpl.signOut', () {
      test('should return Success when sign out succeeds', () async {
        // Arrange
        when(mockAuth.signOut()).thenAnswer((_) async {});

        // Act
        final result = await repository.signOut();

        // Assert
        expect(result.isSuccess, true);

        verify(mockAuth.signOut()).called(1);
        verifyNoMoreInteractions(mockAuth);
      });

      test('should return AuthFailure when FirebaseAuthException thrown', () async {
        // Arrange
        when(mockAuth.signOut()).thenThrow(
          fb.FirebaseAuthException(
            code: code,
            message: message,
          ),
        );

        // Act
        final result = await repository.signOut();
        final failure = result.failure!;

        // Assert
        expect(result.isFailure, true);

        expect(failure, isA<AuthFailure>());
        expect(failure.code, code);
        expect(failure.message, message);

        verify(mockAuth.signOut()).called(1);
        verifyNoMoreInteractions(mockAuth);
      });

      test('should return UnknownAuthFailure when unexpected error thrown', () async {
        // Arrange
        when(mockAuth.signOut()).thenThrow(Object());

        // Act
        final result = await repository.signOut();
        final failure = result.failure!;

        // Assert
        expect(result.isFailure, true);
        expect(failure, isA<UnknownAuthFailure>());

        verify(mockAuth.signOut()).called(1);
        verifyNoMoreInteractions(mockAuth);
      });
    });

    group('AuthRepositoryImpl.authStateChanges', () {
      void arrangeStream() {
        when(mockUser.uid).thenReturn(uid);
        when(mockUser.email).thenReturn(email);
        when(mockCredential.user).thenReturn(mockUser);
      }

      test('should emit User when Firebase user is not null', () async {
        // Arrange
        arrangeStream();

        final controller = StreamController<fb.User?>.broadcast();
        addTearDown(() async => await controller.close());

        when(mockAuth.authStateChanges()).thenAnswer((_) => controller.stream);

        final users = <User?>[];

        final sub = repository.authStateChanges.listen(users.add);
        addTearDown(() async => await sub.cancel());

        // Act
        controller.add(mockUser);
        await pumpEventQueue();

        // Assert
        final user = users.first!;
        expect(user.uid, uid);
        expect(user.email, email);

        verify(mockAuth.authStateChanges()).called(1);
        verifyNoMoreInteractions(mockAuth);
      });

      test('should emit null when Firebase user is null', () async {
        // Arrange
        final controller = StreamController<fb.User?>.broadcast();
        addTearDown(() async => controller.close());

        when(mockAuth.authStateChanges()).thenAnswer((_) => controller.stream);

        final users = <User?>[];

        final sub = repository.authStateChanges.listen(users.add);
        addTearDown(() async => sub.cancel());

        // Act
        controller.add(null);
        await pumpEventQueue();

        // Assert
        final user = users.first;
        expect(user, null);

        verify(mockAuth.authStateChanges()).called(1);
        verifyNoMoreInteractions(mockAuth);
      });

      test('should emit sequence of auth state changes', () async {
        // Arrange
        arrangeStream();

        final controller = StreamController<fb.User?>.broadcast();
        addTearDown(() async => controller.close());

        when(mockAuth.authStateChanges()).thenAnswer((_) => controller.stream);

        final users = <User?>[];

        final sub = repository.authStateChanges.listen(users.add);
        addTearDown(() async => sub.cancel());

        // Act
        controller.add(null);
        await pumpEventQueue();

        controller.add(mockUser);
        await pumpEventQueue();

        controller.add(null);
        await pumpEventQueue();

        // Assert
        expect(users.first, null);

        final user = users.singleWhere((user) => user != null)!;
        expect(user.uid, uid);
        expect(user.email, email);

        expect(users.last, null);

        verify(mockAuth.authStateChanges()).called(1);
        verifyNoMoreInteractions(mockAuth);
      });
    });
  });
}
