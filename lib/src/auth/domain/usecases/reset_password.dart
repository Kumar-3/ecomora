import 'package:ecom/core/usecase/usecase.dart';
import 'package:ecom/core/utils/typedefs.dart';
import 'package:ecom/src/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class ResetPassword extends UsecaseWithParams<void, ResetPasswordParams> {
  ResetPassword(this._repo);
  final AuthRepository _repo;
  @override
  ResultFuture<void> call(ResetPasswordParams params) =>
      _repo.resetPassword(email: params.email, password: params.password);
}

class ResetPasswordParams extends Equatable {
  const ResetPasswordParams({required this.email, required this.password});
  const ResetPasswordParams.empty() : email = "Test String", password = "Test String";

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
