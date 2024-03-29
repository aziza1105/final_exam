import 'package:final_exam/core/exception/exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRemoteDataSource {
  Future<User?> getUser();

  Future<User?> login(String email, String password);

  Future<void> logout();

  Future<User?> signUp(String email, String password);
  factory AuthenticationRemoteDataSource() =>
      _AuthenticationRemoteDataSourceImpl();
}

class _AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  @override
  Future<User?> getUser() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw ServerException(
          message: 'User is null',
          code: 140,
        );
      }
      return currentUser;
    } catch (e) {
      throw ServerException(
        message: 'Failed to get user: $e',
        code: 500,
      );
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return await getUser();
    } catch (e) {
      throw ServerException(
        message: 'Failed to login: $e',
        code: 500,
      );
    }
  }

  @override
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw ServerException(
        message: 'Failed to logout: $e',
        code: 500,
      );
    }
  }

  @override
  Future<User?> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return FirebaseAuth.instance.currentUser;
    } catch (e) {
      throw ServerException(
        message: 'Failed to sign up: $e',
        code: 500,
      );
    }
  }
}
