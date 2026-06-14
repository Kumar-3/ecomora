import 'package:ecom/core/common/entities/user.dart';
import 'package:ecom/core/usecase/usecase.dart';
import 'package:ecom/core/utils/typedefs.dart';
import 'package:ecom/src/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class Login extends UsecaseWithParams<User, LoginParams> {
  Login(this._repo);
  final AuthRepository _repo;

  @override
  ResultFuture<User> call(LoginParams params) =>
      _repo.login(email: params.email, password: params.password);
}

class LoginParams extends Equatable {
  const LoginParams({required this.email, required this.password});
  const LoginParams.empty() : email = "Test String", password = "Test String";
  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
