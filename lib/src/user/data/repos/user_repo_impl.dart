import 'package:dartz/dartz.dart';
import 'package:ecom/core/common/entities/user.dart';
import 'package:ecom/core/errors/exceptions.dart';
import 'package:ecom/core/errors/failure.dart';
import 'package:ecom/core/utils/typedefs.dart';
import 'package:ecom/src/user/data/datasources/user_remote_data_src.dart';
import 'package:ecom/src/user/domain/repos/user_repo.dart';

class UserRepoImpl implements UserRepo {
  const UserRepoImpl(this._remoteDataSrc);
  final UserRemoteDataSrc _remoteDataSrc;

  @override
  ResultFuture<User> getUser(String userId) async {
    try {
      final result = await _remoteDataSrc.getUser(userId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<String> getUserPaymentProfile(String userId) async {
    try {
      final result = await _remoteDataSrc.getUserPaymentProfile(userId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<User> updateUser({required String userId, required DataMap updatedData}) async {
    try {
      final result = await _remoteDataSrc.updateUser(userId: userId, updatedData: updatedData);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
