import 'package:ecom/core/common/entities/user.dart';
import 'package:ecom/core/usecase/usecase.dart';
import 'package:ecom/core/utils/typedefs.dart';
import 'package:ecom/src/user/domain/repos/user_repo.dart';

class GetUser extends UsecaseWithParams<User, String> {
  const GetUser(this._repo);
  final UserRepo _repo;
  @override
  ResultFuture<User> call(String params) => _repo.getUser(params);
}
