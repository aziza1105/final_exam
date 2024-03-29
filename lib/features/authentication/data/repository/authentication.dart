import '../../../../core/either/either.dart';
import '../../../../core/exception/exception.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entity/authenticated_user.dart';
import '../../domain/repository/authentication.dart';
import '../data_source/remote.dart';
import '../models/authenticated_user.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource _dataSource;

  AuthenticationRepositoryImpl({
    required AuthenticationRemoteDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> getUser() async {
    try {
      final user = await _dataSource.getUser();
      if (user != null) {
        return Right(AuthenticatedUserModel.fromFirebaseUser(user));
      } else {
        return Left(ServerFailure(message: 'User is null', code: 140));
      }
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> login(
      String email, String password) async {
    try {
      final user = await _dataSource.login(email, password);
      if (user != null) {
        return Right(AuthenticatedUserModel.fromFirebaseUser(user));
      } else {
        return Left(ServerFailure(message: 'User is null', code: 140));
      }
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _dataSource.logout();
      return Right(null);
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> signUp(
      String email, String password) async {
    try {
      final user = await _dataSource.signUp(email, password);
      if (user != null) {
        return Right(AuthenticatedUserModel.fromFirebaseUser(user));
      } else {
        return Left(ServerFailure(message: 'User is null', code: 140));
      }
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }
}
