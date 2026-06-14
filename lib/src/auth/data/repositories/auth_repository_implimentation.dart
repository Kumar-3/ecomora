import 'package:dartz/dartz.dart';
import 'package:ecom/core/common/entities/user.dart';
import 'package:ecom/core/errors/exceptions.dart';
import 'package:ecom/core/errors/failure.dart';
import 'package:ecom/core/utils/typedefs.dart';
import 'package:ecom/src/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ecom/src/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImplimentation implements AuthRepository {
  AuthRepositoryImplimentation(this._remoteDataSource);
  final AuthRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<void> forgetPassword(String email) async {
    try {
      await _remoteDataSource.forgetPassword(email);
      return const Right(null);
    } on ServerException catch (e) {
      return left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<User> login({required String email, required String password}) async {
    try {
      final result = await _remoteDataSource.login(email: email, password: password);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> register({
    required String name,
    required String password,
    required String email,
    required String phone,
  }) async {
    try {
      await _remoteDataSource.register(name: name, password: password, email: email, phone: phone);
      return const Right(null);
    } on ServerException catch (e) {
      return left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> resetPassword({required String email, required String password}) async {
    try {
      await _remoteDataSource.resetPassword(email: email, password: password);
      return const Right(null);
    } on ServerException catch (e) {
      return left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> verifyOTP({required String email, required String otp}) async {
    try {
      await _remoteDataSource.verifyOTP(email: email, otp: otp);
      return const Right(null);
    } on ServerException catch (e) {
      return left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<bool> verifyToken() async {
    try {
      final result = await _remoteDataSource.verifyToken();
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure.fromException(e));
    }
  }
}
